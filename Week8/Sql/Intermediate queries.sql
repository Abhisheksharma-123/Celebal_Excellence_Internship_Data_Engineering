-- 4. Find customers who placed orders but never had any item delivered 
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id NOT IN (
    SELECT customer_id
    FROM orders
    WHERE status = 'DELIVERED'
);
-- 5. Products that were ordered but had more returns than purchases 
SELECT p.product_id,
p.product_name,
SUM(CASE WHEN oi.quantity > 0 THEN oi.quantity ELSE 0 END) AS purchases,
SUM(CASE WHEN oi.quantity < 0 THEN ABS(oi.quantity) ELSE 0 END) AS returns
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING returns > purchases;
-- 6. Calculate the return rate (returned items / total items) per category 
SELECT p.product_id,
p.product_name,
SUM(CASE WHEN o.status <> 'RETURNED' THEN oi.quantity ELSE 0 END) AS purchases,
SUM(CASE WHEN o.status = 'RETURNED' THEN oi.quantity ELSE 0 END) AS returns
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
GROUP BY p.product_id, p.product_name
HAVING returns > purchases;