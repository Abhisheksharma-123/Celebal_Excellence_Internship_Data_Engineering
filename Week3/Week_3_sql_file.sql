create database superstore_db;
USE superstore_db;

-- Step 1: Setup Data 
-- create customers table
CREATE TABLE customers (
    Customer_ID    VARCHAR(20),
    Customer_Name  VARCHAR(100),
    Segment        VARCHAR(30),
    Country        VARCHAR(50),
    City           VARCHAR(50),
    State          VARCHAR(50),
    Postal_Code    VARCHAR(15),
    Region         VARCHAR(20)
);
-- Insert into customers
INSERT INTO customers
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    Segment,
    Country,
    City,
    State,
    `Postal Code`,
    Region
FROM superstore_raw;

-- create products table
CREATE TABLE products (
    Product_ID    VARCHAR(20),
    Category      VARCHAR(30),
    Sub_Category  VARCHAR(30),
    Product_Name  VARCHAR(200)
);
-- Insert into products
INSERT INTO products
SELECT DISTINCT
    `Product ID`,
    Category,
    `Sub-Category`,
    `Product Name`
FROM superstore_raw;

-- create orders table
CREATE TABLE orders (
    Order_ID    VARCHAR(20),
    Order_Date  VARCHAR(20),
    Ship_Date   VARCHAR(20),
    Ship_Mode   VARCHAR(30),
    Customer_ID VARCHAR(20),
    Product_ID  VARCHAR(20),
    Sales       DOUBLE,
    Quantity    INT,
    Discount    DOUBLE,
    Profit      DOUBLE
);
-- Insert into orders
INSERT INTO orders
SELECT DISTINCT
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;

-- Step 2: Perform Required Queries 

-- Query 1:
select * from orders where sales > (select avg(sales) from orders);
-- Query 2:
select * from orders o where sales = ( select max(sales) from orders where customer_id = o.customer_id);
-- Query 3:
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales;
-- Query 4:
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- Query 5:
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_sales,
    RANK() OVER(ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales;

-- Query 6:
SELECT
    customer_id,
    order_id,
    sales,
    ROW_NUMBER() OVER
    (
        PARTITION BY customer_id
        ORDER BY sales DESC
    ) AS row_num
FROM orders;

-- Query 7:
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM
(
    SELECT
        customer_id,
        total_sales,
        RANK() OVER(ORDER BY total_sales DESC) AS rnk
    FROM customer_sales
) t
WHERE rnk <= 3;
-- Step 3: Final Combined Query 
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales,
    RANK() OVER
    (
        ORDER BY cs.total_sales DESC
    ) AS customer_rank
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id;

-- Mini Project: Customer Sales Insights 
-- 1:Who are the top 5 customers?  
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id
ORDER BY cs.total_sales DESC
LIMIT 5;
-- 2:Who are the bottom 5 customers?  
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id
ORDER BY cs.total_sales ASC
LIMIT 5;
-- 3:Which customers made only one order?  
SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) = 1;
-- 4:Which customers have above-average sales?  
WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id
WHERE cs.total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
)
ORDER BY cs.total_sales DESC;
-- 5:What is the highest order value per customer? 
SELECT
    c.customer_name,
    MAX(o.sales) AS highest_order_value
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name
ORDER BY highest_order_value DESC;