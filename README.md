# Azure End-to-End Data Engineering Project

This repository contains a complete Azure Data Engineering pipeline built from scratch, covering every stage from raw data ingestion to analytics. The project demonstrates the integration of multiple Azure services to create a robust, scalable, and automated ETL workflow.

---

## Project Overview

This project showcases an end-to-end data engineering solution using the following Azure components:

- **Azure Data Factory (ADF):** For orchestrating ETL pipelines.
- **Azure Data Lake Storage Gen2:** For storing data in a medallion architecture (Bronze, Silver, Gold).
- **Azure Databricks (PySpark):** For data transformation and processing.
- **Azure Synapse Analytics:** For data warehousing and analytical querying.
- **Power BI:** For visualization and business insights.

The project is based on the **AdventureWorks dataset**, which simulates a real-world retail sales scenario containing multiple relational tables such as Sales, Products, Customers, and Returns.

---

## Architecture

The project follows the **Medallion Architecture**, consisting of three layers:

| Layer | Description |
|--------|--------------|
| **Bronze (Raw)** | Stores raw data ingested from the source (GitHub API). |
| **Silver (Transformed)** | Contains cleaned and transformed data using Databricks and PySpark. |
| **Gold (Serving)** | Optimized layer for analytics, hosted in Azure Synapse Analytics. |

**Data Flow Summary:**
1. Data is pulled from GitHub API using Azure Data Factory.
2. Raw data is stored in the Bronze container of Azure Data Lake.
3. Databricks performs data transformation and stores the processed data into the Silver container.
4. Transformed data is then loaded into Synapse Analytics (Gold layer) for analysis.
5. Power BI connects with Synapse to visualize the data.

---

## Tools and Technologies

| Tool | Purpose |
|------|----------|
| **Azure Data Factory** | ETL orchestration and pipeline management |
| **Azure Data Lake Gen2** | Central data storage across layers |
| **Azure Databricks** | Data transformation using PySpark |
| **Azure Synapse Analytics** | Data warehousing and SQL analytics |
| **Power BI** | Reporting and visualization |
| **GitHub API** | Data ingestion source |

---

## Dataset

- **Name:** AdventureWorks Dataset  
- **Type:** Relational Tables (Sales, Products, Customers, Returns, etc.)  
- **Source:** [Kaggle - AdventureWorks Dataset](https://www.kaggle.com/datasets/ukvethav/adventureworks-dataset)  
- **Format:** CSV files  

---

## Key Features

- Dynamic and parameterized pipelines in Azure Data Factory using **ForEach loops**.
- Data ingestion through **HTTP Linked Service** connected to GitHub API.
- Data transformation using **Databricks and PySpark** with the Medallion architecture.
- Schema-based loading and querying in **Azure Synapse Analytics**.
- Final analytical layer connected to **Power BI** for visualization.
- Covers **real-time and interview-level scenarios** (parameters, loops, dynamic paths).

---

## Project Structure

azure-end-to-end-data-engineering-project/
│
├── datasets/
│ └── *.csv # Sample dataset files
│
├── scripts/
│ ├── adf_pipeline.json # ADF pipeline export
│ ├── databricks_transformations.py
│ ├── pyspark_cleaning_script.py
│ └── synapse_queries.sql
│
├── architecture/
│ └── project_architecture.png # Architecture diagram
│
├── documentation/
│ └── project_report.md # Detailed project documentation
│
└── README.md

---

## How to Recreate the Project

1. **Create Azure Resources:**
   - Resource Group  
   - Azure Data Lake Gen2  
   - Azure Data Factory  
   - Azure Databricks  
   - Azure Synapse Analytics  

2. **Ingest Data:**
   - Use **ADF Copy Activity** to fetch CSV data from GitHub (via HTTP Linked Service).
   - Store raw files into the **Bronze layer** in Azure Data Lake.

3. **Transform Data:**
   - Launch **Databricks notebook** and use **PySpark** for transformations.
   - Write cleaned output to the **Silver layer**.

4. **Load Data:**
   - Create **external tables** in **Synapse Analytics** using `OPENROWSET` and link to Silver layer data.
   - Store final structured tables in the **Gold layer**.

5. **Visualize:**
   - Connect Power BI to Synapse Analytics and build dashboards.

---

## Outcomes

- Fully automated Azure data pipeline from source to analytics.
- Strong understanding of Azure Data Factory, Databricks, and Synapse integration.
- Demonstrates real-time data engineering skills applicable for professional projects and interviews.

---

## Author

**Muhammad Yaseen**  
Data Science Student | Aspiring Data Engineer  
[LinkedIn](#) | [GitHub](#)
