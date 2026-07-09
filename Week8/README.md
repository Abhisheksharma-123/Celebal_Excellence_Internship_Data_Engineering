# Week 8 - E-Commerce Analytics System

## Objective

Build an end-to-end E-Commerce Analytics System using Python, Pandas, and MySQL. The project covers data generation, data cleaning, SQL analytics, reporting, and edge case testing.

---

## Project Workflow

- Generated realistic e-commerce datasets using Python.
- Introduced intentional data inconsistencies for cleaning practice.
- Cleaned datasets using Pandas.
- Loaded cleaned data into MySQL.
- Designed SQL tables with primary and foreign keys.
- Performed SQL analytics using Joins, Aggregations, CTEs, and Window Functions.
- Built a Python CLI tool to generate reports from the MySQL database.
- Tested common edge cases to validate data quality.

---

## Technologies Used

- Python
- Pandas
- Faker
- NumPy
- MySQL Workbench
- MySQL Connector
- Tabulate
- SQL
- Jupyter Notebook

---

## Project Structure

```text
Week8/
│── Data/
│   ├── raw/
│   │   ├── customers.csv
│   │   ├── products.csv
│   │   ├── orders.csv
│   │   └── order_items.csv
│   │
│   └── cleaned/
│       ├── customers_clean.csv
│       ├── products_clean.csv
│       ├── orders_clean.csv
│       └── order_items_clean.csv
│
│── Notebook/
│   ├── Data_Generation.ipynb
│   └── Data_Cleaning.ipynb
│
│── Scripts/
│   ├── report_cli.py
│   └── edge_case_tests.py
│
│── Sql/
│   ├── Mysql load.sql
│   ├── Basic Queries.sql
│   ├── Intermediate queries.sql
│   └── Advanced Queries.sql
│
│── Screenshot_of_queries/
│   ├── Basic Queries
│   ├── Intermediate Queries
│   ├── Advanced Queries
│   └── MySQL Load
│
│── Output_of_CLI_tool/
│   └── CLI Output Screenshots
│
└── README.md
```

## Features

- Fake data generation
- Data cleaning and validation
- MySQL database integration
- SQL analytics and reporting
- Window Functions and CTEs
- Customer cohort analysis
- Command Line Interface (CLI) reporting
- Edge case testing

---

## Sample CLI Commands

```bash
python report_cli.py --report revenue
```

```bash
python report_cli.py --report top_customers
```

---

## Learning Outcomes

- Data Generation using Faker
- Data Cleaning with Pandas
- MySQL Database Design
- SQL Joins and Aggregations
- Window Functions
- Common Table Expressions (CTEs)
- Cohort Analysis
- Python MySQL Connectivity
- Command Line Interface (CLI)
- Edge Case Testing

---

## Conclusion

This project demonstrates a complete e-commerce analytics workflow, starting from dataset generation and data cleaning to SQL-based analysis, reporting, and testing. It helped strengthen practical skills in Python, Pandas, MySQL, and data analytics.
