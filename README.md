# 📊 Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a comprehensive data warehousing and analytics solution — from building a data warehouse to generating actionable insights.  
Designed as a **portfolio project**, it highlights **industry best practices** in data engineering and analytics.

---

## 🏗️ Data Architecture

The data architecture for this project follows the **Medallion Architecture** model: **Bronze**, **Silver**, and **Gold** layers.
![Data Architecture](docs/data_architecture.png)
### 🔹 Bronze Layer
Stores raw data *as-is* from the source systems.  
Data is ingested from **CSV Files into a SQL Server Database**.

### ⚙️ Silver Layer
Includes data **cleansing**, **standardization**, and **normalization** processes  
to prepare data for analysis.

### 🥇 Gold Layer
Houses **business-ready data** modeled into a **star schema**  
that supports **reporting** and **analytics**.

---

## 📖 Project Overview

This project involves:

- **Data Architecture**: Designing a modern data warehouse using Medallion Architecture.
- **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
- **Data Modeling**: Developing **fact** and **dimension tables** optimized for analytical queries.
- **Analytics & Reporting**: Creating **SQL-based reports** and **dashboards** for actionable insights.

---

## 🎯 Target Audience

This repository is an excellent resource for:

- 🧠 SQL Developers  
- 🏗️ Data Architects  
- ⚙️ Data Engineers  
- 🔄 ETL Pipeline Developers  
- 🗂️ Data Modelers  
- 📈 Data Analysts  

---
# 🚀 Project Requirements

## 📦 Building the Data Warehouse (Data Engineering)

### 🎯 Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

### ✅ Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

## 📊 BI: Analytics & Reporting (Data Analysis)

### 🎯 Objective
Develop SQL-based analytics to deliver detailed insights into:

- Customer Behavior
- Product Performance
- Sales Trends

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

> For more details, refer to `docs/requirements.md`.

---

## 📂 Repository Structure

data-warehouse-project/
├── 📂 datasets/
│   └── 📂 docs/
│       ├── etl.drawio
│       ├── data_architecture.drawio
│       ├── data_catalog.md
│       ├── data_flow.drawio
│       ├── data_models.drawio
│       └── naming-conventions.md
│
├── 📂 scripts/
│   ├── 📂 bronze/    # Raw data extraction
│   ├── 📂 silver/    # Data cleaning/transformation
│   └── 📂 gold/      # Analytical model creation
│
└── 📂 tests/
    ├── README.md
    ├── LICENSE
    ├── .gitignore
    └── requirements.txt

----------------------------------------------------------------------------------------------------------------------------------
## 🌟 About Me

Hi there! I'm **Baraa Khatib Salkini**, also known as **Data With Baraa**.  
I’m an IT professional and passionate YouTuber on a mission to share knowledge and make working with data enjoyable and engaging!

---

### 📬 Let's stay in touch!
- 💼 [LinkedIn](https://www.linkedin.com/in/ahmedghoonim)   
- 📘 [Facebook](https://www.facebook.com/share/19JWnRjSrQ/)
