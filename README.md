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



# Assignment-Week-4
# Azure Cloud Fundamentals and Data Pipeline using Azure Data Factory

## Project Overview
This project demonstrates the implementation of an end-to-end data pipeline using Microsoft Azure services. The pipeline reads a CSV file from Azure Blob Storage, validates file metadata, and copies the data to a destination location using Azure Data Factory (ADF).

## Tools & Services Used
- Azure Portal
- Azure Resource Group
- Azure Storage Account
- Azure Blob Storage
- Azure Data Factory (ADF)
- IAM (Reader & Contributor Roles)

## Steps Performed
1. Created a Resource Group in Azure.
2. Created a Storage Account and Blob Container.
3. Uploaded a CSV file to Blob Storage.
4. Created Azure Data Factory.
5. Configured Linked Service for Blob Storage.
6. Created Source and Destination Datasets.
7. Used **Get Metadata** activity to validate file information.
8. Built a pipeline using **Copy Data** activity.
9. Executed the pipeline using Debug/Trigger.
10. Assigned IAM roles (Reader and Contributor).
11. Successfully copied data from source to destination.

## Pipeline Flow
Blob Storage (Source CSV) → Get Metadata → Copy Data Activity → Destination Storage

## Output
- Resource Group created successfully.
- Storage Account and Blob Container configured.
- Linked Service and Datasets created.
- Metadata validated.
- Pipeline executed successfully.
- Data copied to destination location.

## Screenshots Included
- Resource Group
- Storage Account & Blob Container
- Azure Data Factory
- Linked Service & Dataset
- Pipeline Design
- Pipeline Execution Result
- IAM Role Assignment

## Conclusion
This project helped in understanding Azure cloud fundamentals, Azure Storage, IAM roles, and building a complete data pipeline using Azure Data Factory.



# Assignment-Week-5
# Spark Fundamentals
## Objective
Learn Spark fundamentals and perform data cleaning, transformation, and aggregation using Spark DataFrames.

## Work Completed
- Explored Spark DataFrame concepts and immutability.
- Cleaned data by handling null values and removing duplicates.
- Applied filtering conditions on datasets.
- Performed aggregations using count, sum, average, minimum, and maximum functions.
- Used `groupBy()` for data analysis and summarization.
- Modified DataFrame schema through casting and renaming columns.
- Handled inconsistent data and missing values.
- Built a complete data processing pipeline using Spark DataFrames.

## Skills Acquired
- Apache Spark Fundamentals
- Spark DataFrames
- Data Cleaning and Preprocessing
- Data Transformation
- Aggregations and Grouping
- Schema Management
- Distributed Data Processing
- Data Pipeline Development

## Technologies Used
- Python
- PySpark
- Jupyter Notebook

## Files Included
- **Week_5.ipynb** – Contains all Spark DataFrame operations and assignment solutions.
- **README.md** – Project overview and documentation.
- **Assignment_Report.md** – Detailed explanation of tasks, outputs, and observations.

## Key Learnings
- Understood the advantages of Spark over MapReduce.
- Learned how Spark DataFrames are immutable.
- Performed data cleaning by handling null values and duplicate records.
- Applied filtering, aggregation, and grouping operations.
- Explored schema modifications and data type casting.
- Built an end-to-end data processing workflow using Spark.

## Conclusion
This assignment provided hands-on experience with Spark DataFrames, data transformation, aggregation, and data cleaning techniques. It helped in understanding how Spark efficiently processes large datasets using distributed computing and in-memory processing.



# Assignment-Week-6
# Spark Architecture and Data Processing

## Objective

Learn Spark Architecture and perform data processing using PySpark. Read data from CSV and Parquet files, apply transformations, handle null values, and build a simple data pipeline.

## Tools Used

- Python
- PySpark
- Databricks
- CSV
- Parquet

## Tasks Performed

- Studied Spark Architecture
- Read CSV and Parquet files
- Filtered and selected data
- Renamed columns
- Cast data types
- Added new columns
- Handled null values
- Compared CSV and Parquet
- Built a simple data pipeline
- Saved processed data as CSV

## Concepts Covered

- Spark Architecture
- Lazy Evaluation
- DAG
- Transformations and Actions
- Shuffle
- Predicate Pushdown
- Schema Handling

## Output

Successfully processed the dataset using PySpark and stored the cleaned data in CSV and Parquet formats.

## Learning Outcome

This assignment helped me understand Spark Architecture, DataFrame operations, file formats, and basic performance optimization techniques in PySpark.



# Assignment-Week-7
# Delta Lake Fundamentals

## Objective
Learn the basics of Delta Lake by creating, managing, and working with Delta tables in Databricks using PySpark.

## Tasks Completed
- Loaded the dataset into Databricks.
- Performed basic data cleaning and transformations.
- Created new columns using `withColumn()`.
- Selected required columns using `select()`.
- Filtered and displayed data using `filter()` and `limit()`.
- Wrote the DataFrame in Delta format.
- Used overwrite mode while saving the Delta table.
- Explored basic Delta Lake operations.

## Technologies Used
- Python
- PySpark
- Databricks
- Delta Lake

## Skills Learned
- DataFrame Transformations
- Delta Table Creation
- Data Selection and Filtering
- Writing Data in Delta Format
- Databricks File Management

## Repository Contents
- `week7_assignment.ipynb` – Assignment notebook
- `README.md` – Project documentation

## Conclusion
This assignment provided practical experience with Delta Lake and PySpark in Databricks. It helped build an understanding of creating Delta tables, performing DataFrame transformations, and managing data efficiently using Delta Lake.
