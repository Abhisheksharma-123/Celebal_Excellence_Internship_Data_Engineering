CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE customers (

    customer_id INT PRIMARY KEY,

    customer_name VARCHAR(100) NOT NULL,

    email VARCHAR(150) NOT NULL,

    registration_date DATE,

    customer_type ENUM('REGULAR','PREMIUM','VIP')
    
);

CREATE TABLE products (

    product_id INT PRIMARY KEY,

    product_name VARCHAR(100) NOT NULL,

    category VARCHAR(50),

    subcategory VARCHAR(50),

    cost_price DECIMAL(10,2)

);

CREATE TABLE orders (

    order_id INT PRIMARY KEY,

    customer_id INT,

    order_date DATETIME,

    status ENUM(
        'PLACED',
        'SHIPPED',
        'DELIVERED',
        'CANCELLED',
        'RETURNED'
    ),

    region_code VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)

);

CREATE TABLE order_items (

    item_id INT PRIMARY KEY,

    order_id INT,

    product_id INT,

    quantity INT,

    unit_price DECIMAL(10,2),

    discount_percent DECIMAL(5,2),

    FOREIGN KEY(order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY(product_id)
    REFERENCES products(product_id)

);

SELECT COUNT(*) AS total_customers
FROM customers;
SELECT COUNT(*) AS total_products
FROM products;
SELECT COUNT(*) AS total_orders
FROM orders;
SELECT COUNT(*) AS total_order_items
FROM order_items;
SELECT *
FROM customers
LIMIT 5;
SELECT *
FROM products
LIMIT 5;
SELECT *
FROM orders
LIMIT 5;
SELECT *
FROM order_items
LIMIT 5;

