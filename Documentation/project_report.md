# Azure End-to-End Data Engineering Project – Detailed Report

---

## Introduction

This project represents a complete Azure Data Engineering workflow built using real-world practices. The goal was to design and implement an automated ETL pipeline that handles data ingestion, transformation, and analytics within the Microsoft Azure ecosystem.

The data used in this project originates from the **AdventureWorks dataset**, a widely used dataset for retail sales analysis containing multiple tables such as Sales, Products, Categories, Customers, and Returns.

---

## Objectives

- Build an end-to-end data pipeline using Azure services.
- Ingest raw data from an API source into Azure Data Lake.
- Transform and clean the data using Azure Databricks and PySpark.
- Load transformed data into Azure Synapse Analytics for analytics.
- Visualize final results in Power BI.

---

## Data Architecture

The project follows the **Medallion Architecture** model, which is a best practice in modern data engineering. It divides the data flow into three logical layers:

1. **Bronze Layer (Raw Data):**
   - Ingests raw data directly from GitHub API using Azure Data Factory.
   - Data is stored in its original form for traceability.

2. **Silver Layer (Transformed Data):**
   - Databricks notebooks read the data from Bronze.
   - Transformation logic is applied using PySpark (cleaning, joining, aggregations).
   - The processed data is stored in the Silver container of Data Lake.

3. **Gold Layer (Analytical Data):**
   - The final, cleaned data is loaded into Azure Synapse Analytics.
   - External tables and queries are used for reporting and analysis.
   - This layer is connected to Power BI for dashboarding.

---

## Tools and Services Used

| Service | Purpose |
|----------|----------|
| **Azure Data Factory** | Orchestrating ETL pipelines; managing parameters, ForEach loops, linked services. |
| **Azure Data Lake Storage Gen2** | Storing data in Bronze, Silver, and Gold layers. |
| **Azure Databricks (PySpark)** | Performing transformations and data cleaning. |
| **Azure Synapse Analytics** | Creating data warehouse and analytical layer. |
| **Power BI** | Visualizing data and generating reports. |
| **GitHub API** | Data source for ingestion via HTTP linked service. |

---

## Process Flow

1. **Resource Setup:**
   - Created a new Azure Resource Group.
   - Deployed Data Lake, ADF, Databricks, and Synapse Analytics.

2. **Data Ingestion (ADF):**
   - Configured **HTTP Linked Service** to connect to GitHub API.
   - Created a **Copy Activity** to load data from API into the Bronze layer.
   - Built both **static** and **dynamic pipelines** using parameters and ForEach loops.

3. **Data Transformation (Databricks + PySpark):**
   - Established a Databricks cluster and connected to Data Lake.
   - Used PySpark scripts to clean, aggregate, and join data tables.
   - Stored transformed data in the Silver layer.

4. **Data Warehousing (Synapse Analytics):**
   - Created external tables using `OPENROWSET()` to read from Silver layer.
   - Built internal tables for optimized querying in the Gold layer.

5. **Visualization (Power BI):**
   - Connected Power BI with Synapse Analytics.
   - Created reports for sales and product performance.

---

## Key Learning Outcomes

- Building dynamic and reusable data pipelines with parameters in ADF.
- Understanding the Medallion architecture for structured data processing.
- Working with Databricks and PySpark for large-scale transformations.
- Integrating Synapse Analytics as a central warehouse.
- Connecting Power BI with Azure services for end-to-end reporting.
- Real-time problem-solving, debugging pipelines, and managing linked services.

---

## Challenges Faced

- Configuring hierarchical namespace correctly while setting up Data Lake.
- Managing dynamic parameters and debugging ForEach loops in ADF.
- Ensuring schema consistency between Silver and Gold layers.
- Optimizing PySpark jobs for performance within Databricks.

---

## Conclusion

This project successfully demonstrates an end-to-end data engineering workflow within Azure. It highlights the ability to design, orchestrate, and manage data pipelines using modern Azure technologies.

Completing this project not only enhanced hands-on experience with tools like ADF, Databricks, and Synapse Analytics but also provided an understanding of real-world scenarios that are essential for a Data Engineering role.

---

## Author

**Muhammad Yaseen**
Data Engineer | Interested in AI, Machine Learning, and Big Data Solutions  