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
