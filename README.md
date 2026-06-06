# Celebal Technologies Data Engineering Internship
# About This Repository

This repository documents my learning journey during the Celebal Technologies Data Engineering Internship, where I complete weekly assignments and hands-on projects to strengthen my understanding of core Data Engineering concepts.

- Skills Covered
- Python
- Pandas
- SQL
- Data Cleaning & Exploration
- ETL / ELT Concepts
- Azure Data Factory
- Apache Spark
- Databricks
- Data Pipeline Design

# Assignment-week-1
# Sports Shoes — Data Cleaning with Pandas

A beginner Python project for exploring and cleaning a sports shoes dataset.

## Files

```
├── sports-shoes.csv               # Raw dataset
├── sports_shoes_analysis.ipynb    # Notebook
├── sports_shoes_cleaned.csv       # Cleaned output
└── README.md
```

## What it does

- Loads a CSV into a Pandas DataFrame
- Explores shape, columns, and data types
- Fills missing values
- Filters rows and selects columns
- Removes duplicates
- Adds a `total_amount` derived column
- Saves the cleaned CSV


# Assignment-week-2 
# SQL E-Commerce Database Assignment
Designed and queried a relational e-commerce database using MySQL.

# Section A — SQL Basics
Concepts: SELECT, DISTINCT, Primary Keys, UNIQUE, NOT NULL, CHECK constraints

- Q4: Primary keys uniquely identify records (customer_id, product_id, order_id, item_id)
- Q5: Duplicate emails are prevented using UNIQUE + NOT NULL
- Q6: Negative prices are blocked using CHECK (unit_price > 0)

# Section B — Filtering & Optimization
Concepts: WHERE, BETWEEN, conditional filtering, indexing, query optimization
Worked with filtered queries and efficient index-aware query design.

# Section C — Aggregation
Concepts: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING, ORDER BY

Performed business analysis using aggregated SQL queries.

# Section D — Joins & Relationships
Concepts: INNER JOIN, LEFT/RIGHT JOIN, multi-table joins, Foreign Keys

- Q22: LEFT JOIN keeps all left-table rows; RIGHT JOIN keeps all right-table rows
- Q23: Foreign key relationships:
  - orders.customer_id → customers.customer_id
  - order_items.order_id → orders.order_id
  - order_items.product_id → products.product_id

# Section E — Advanced SQL
Concepts: CASE, conditional aggregation, transactions, COMMIT/ROLLBACK, ACID

ACID Properties:

- Atomicity: all-or-nothing execution
- Consistency: valid database state maintained
- Isolation: concurrent transactions remain independent
- Durability: committed data persists


# Assignment-Week-3 
# SQL Analysis

## Objective
Analyze the Superstore dataset using SQL concepts such as Subqueries, CTEs, Window Functions, and Joins to generate customer sales insights.

## Tasks Performed
- Imported Superstore dataset into `superstore_raw`.
- Created `customers`, `orders`, and `products` tables.
- Inserted data using `SELECT DISTINCT`.
- Applied Subqueries, CTEs, and Window Functions.
- Solved business-related sales queries.

## SQL Concepts Used
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions (`ROW_NUMBER()`, `RANK()`)
- Joins
- Aggregate Functions (`SUM`, `AVG`, `MAX`)

## Business Questions Solved
- Top 5 customers
- Bottom 5 customers
- Customers with only one order
- Customers with above-average sales
- Highest order value per customer

## Tools Used
- MySQL Workbench
- SQL
- Sample Superstore Dataset

## Conclusion
This assignment demonstrates how SQL can be used to analyze sales data and generate meaningful business insights using advanced SQL techniques.
