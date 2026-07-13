# 🏥 Healthcare Data Engineering Pipeline using Medallion Architecture

## 📌 Project Overview

This project demonstrates the implementation of a modern **Healthcare Data Engineering Pipeline** using the **Medallion Architecture (Bronze, Silver, Gold)**. The pipeline ingests raw healthcare datasets, performs data cleaning, data transformation, and creates analytics-ready datasets using **PySpark**, **Azure Databricks**, and **Delta Lake**.

The Medallion Architecture helps organize data into different quality levels, making it easier to maintain scalable, reliable, and efficient ETL pipelines.

---

## 🏗️ Architecture

```text
                Raw Healthcare Data
                        │
                        ▼
               ┌──────────────────┐
               │   Bronze Layer   │
               │   Raw Ingestion  │
               └──────────────────┘
                        │
                        ▼
               ┌──────────────────┐
               │   Silver Layer   │
               │ Data Cleaning &  │
               │ Transformations  │
               └──────────────────┘
                        │
                        ▼
               ┌──────────────────┐
               │    Gold Layer    │
               │ Business Metrics │
               │ Analytics Tables │
               └──────────────────┘
```

---

## 🎯 Project Objectives

- Implement Medallion Architecture using Delta Lake.
- Clean and transform raw healthcare datasets.
- Create analytics-ready datasets.
- Demonstrate industry-standard Data Engineering practices.

---

## 📂 Project Structure

```text
Healthcare_Medallion_Architecture_Final_project/
│
├── Data/
├── Datasets/
├── Notebooks/
├── Screenshot/
```

---

## ⚙️ Technologies Used

- Python
- PySpark
- Apache Spark
- Azure Databricks
- Delta Lake
- SQL
- Azure Data Lake Storage (ADLS)

---

## 🥉 Bronze Layer

The Bronze layer stores raw healthcare data exactly as received from the source.

### Tasks Performed

- Data ingestion
- Raw data storage
- Schema preservation
- Delta table creation

---

## 🥈 Silver Layer

The Silver layer cleans and standardizes the data.

### Tasks Performed

- Remove duplicates
- Handle missing values
- Data validation
- Standardize column names
- Data type conversion
- Business rule implementation

---

## 🥇 Gold Layer

The Gold layer contains business-ready datasets for reporting and analytics.

### Tasks Performed

- Business aggregations
- KPI calculations
- Analytical datasets
- Optimized reporting tables

---

## 🔄 ETL Workflow

1. Load raw healthcare datasets.
2. Store raw data in Bronze Delta tables.
3. Clean and validate data in Silver layer.
4. Apply business transformations.
5. Generate Gold layer analytical tables.
6. Store final Delta tables for reporting.

---

## 📊 Features

- Medallion Architecture
- Delta Lake Storage
- PySpark Transformations
- Data Cleaning & Validation
- Scalable Data Processing
- Analytics-Ready Data Model

---

## 📈 Business Benefits

- Improved data quality
- Better reporting
- Scalable architecture
- Reliable analytics
- Faster query performance
- Easy maintenance

---

## 📝 Conclusion

This project demonstrates the implementation of a complete Healthcare Data Engineering pipeline using the **Medallion Architecture**. By organizing data into **Bronze**, **Silver**, and **Gold** layers, the pipeline ensures improved data quality, scalability, and efficient data processing.

Using **PySpark**, **Azure Databricks**, and **Delta Lake**, the project showcases industry-standard ETL practices, including data ingestion, cleaning, transformation, and the creation of analytics-ready datasets. This architecture provides a strong foundation for business intelligence, reporting, and advanced analytics while supporting future enhancements such as incremental loading, workflow automation, and real-time data processing.

Overall, this project reflects modern Data Engineering best practices and demonstrates the ability to design, build, and manage scalable data pipelines for healthcare data.

## 👨‍💻 Author

**Abhishek Sharma**

Aspiring Data Engineer
