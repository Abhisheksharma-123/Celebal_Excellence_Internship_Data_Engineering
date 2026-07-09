-- 1. Total revenue per category (revenue = quantity × unit_price × (1 - discount_percent/100))
SELECT p.category,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)),2) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 2. Top 10 customers by total order value 
SELECT c.customer_id,
c.customer_name,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_percent/100)),2) AS total_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_order_value DESC
LIMIT 10;

-- 3. Month-wise order count for the last 12 months
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month,
COUNT(order_id) AS total_orders
FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY DATE_FORMAT(order_date,'%Y-%m')
ORDER BY month;