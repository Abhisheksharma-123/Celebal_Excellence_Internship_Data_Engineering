-- 7. Running Totals with Window Functions
SELECT
o.region_code,
DATE(o.order_date) AS order_date,
ROUND(SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)),2) AS daily_revenue,
ROUND(SUM(SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)))
OVER(PARTITION BY o.region_code ORDER BY DATE(o.order_date)),2) AS running_total
FROM orders o
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY o.region_code,DATE(o.order_date)
ORDER BY o.region_code,order_date;

-- 8. Ranking with DENSE_RANK
SELECT
p.category,
p.product_name,
ROUND(SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)),2) AS total_revenue,
DENSE_RANK() OVER(PARTITION BY p.category
ORDER BY SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)) DESC) AS rank_in_category
FROM products p
JOIN order_items oi ON p.product_id=oi.product_id
GROUP BY p.category,p.product_name;

-- 9. LAG Analysis
SELECT
customer_id,
order_date,
LAG(order_date) OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_order_date,
DATEDIFF(order_date,LAG(order_date) OVER(PARTITION BY customer_id ORDER BY order_date)) AS days_gap
FROM orders;
SELECT
customer_id,
AVG(days_gap) AS avg_gap,
CASE
WHEN AVG(days_gap)>30 THEN 'At Risk'
ELSE 'Active'
END AS status
FROM(
SELECT
customer_id,
DATEDIFF(order_date,LAG(order_date) OVER(PARTITION BY customer_id ORDER BY order_date)) AS days_gap
FROM orders
)t
GROUP BY customer_id;
 
-- 10. CTE with Multiple Levels
WITH monthly_revenue AS(
SELECT
customer_id,
DATE_FORMAT(order_date,'%Y-%m') AS month,
SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY customer_id,month
),
customer_segment AS(
SELECT *,
CASE
WHEN revenue>10000 THEN 'High'
WHEN revenue BETWEEN 5000 AND 10000 THEN 'Medium'
ELSE 'Low'
END AS segment
FROM monthly_revenue
)
SELECT month,segment,COUNT(customer_id) AS total_customers
FROM customer_segment
GROUP BY month,segment;

-- 11. NTILE for Segmentation
SELECT
customer_id,
total_value,
NTILE(4) OVER(ORDER BY total_value DESC) AS quartile,
CASE
WHEN NTILE(4) OVER(ORDER BY total_value DESC)=1 THEN 'Platinum'
WHEN NTILE(4) OVER(ORDER BY total_value DESC)=2 THEN 'Gold'
WHEN NTILE(4) OVER(ORDER BY total_value DESC)=3 THEN 'Silver'
ELSE 'Bronze'
END AS quartile_label
FROM(
SELECT
o.customer_id,
SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY o.customer_id
)t;

-- 12. Year-over-Year Comparison
WITH monthly_sales AS(
SELECT
YEAR(order_date) AS year,
MONTH(order_date) AS month,
SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY year,month
)
SELECT
year,
month,
revenue,
LAG(revenue) OVER(ORDER BY year,month) AS prev_year_revenue,
ROUND(((revenue-LAG(revenue) OVER(ORDER BY year,month))/LAG(revenue) OVER(ORDER BY year,month))*100,2) AS yoy_growth_percent
FROM monthly_sales;

-- 13. First/Last Value Analysis
WITH customer_category AS(
SELECT
o.customer_id,
o.order_date,
p.category
FROM orders o
JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
)
SELECT
customer_id,
FIRST_VALUE(category) OVER(PARTITION BY customer_id ORDER BY order_date) AS first_category,
LAST_VALUE(category) OVER(PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_category,
CASE
WHEN FIRST_VALUE(category) OVER(PARTITION BY customer_id ORDER BY order_date)=
LAST_VALUE(category) OVER(PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
THEN 'No'
ELSE 'Yes'
END AS category_shift
FROM customer_category;

-- 14. Cumulative Distribution
WITH customer_revenue AS(
SELECT
o.customer_id,
SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY o.customer_id
)
SELECT
customer_id,
revenue,
SUM(revenue) OVER(ORDER BY revenue DESC) AS cumulative_revenue,
ROUND(CUME_DIST() OVER(ORDER BY revenue DESC)*100,2) AS cumulative_percent
FROM customer_revenue;

-- 15. Complex CTE - Cohort Analysis
WITH cohort AS (
    SELECT customer_id,
           MIN(order_date) AS first_order,
           DATE_FORMAT(MIN(order_date),'%Y-%m') AS cohort_month
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.cohort_month,
    TIMESTAMPDIFF(MONTH, c.first_order, o.order_date) AS month_number,
    COUNT(DISTINCT o.customer_id) AS retained_customers
FROM cohort c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY
    c.cohort_month,
    TIMESTAMPDIFF(MONTH, c.first_order, o.order_date)
ORDER BY
    c.cohort_month,
    TIMESTAMPDIFF(MONTH, c.first_order, o.order_date);
    
-- 16. Self Join - Frequently Bought Together
SELECT
oi1.product_id AS product_a,
oi2.product_id AS product_b,
COUNT(*) AS times_bought_together
FROM order_items oi1
JOIN order_items oi2
ON oi1.order_id=oi2.order_id
AND oi1.product_id<oi2.product_id
GROUP BY oi1.product_id,oi2.product_id
ORDER BY times_bought_together DESC;