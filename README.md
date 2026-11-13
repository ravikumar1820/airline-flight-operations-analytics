# ✈️ Airline Flight Operations Analytics

An end-to-end airline analytics project built using **Databricks SQL** and **Medallion Architecture** to analyze airline performance, flight delays, route activity, and data quality.

## 📌 Project Overview

This project transforms raw airline flight data into meaningful business insights using a structured Bronze, Silver, and Gold data architecture.

The objective is to understand airline performance, identify delay patterns, compare routes, and support data-driven operational decisions.

## 🎯 Business Objectives

- Analyze total flights across different airlines.
- Compare airline performance and on-time percentages.
- Identify airlines with higher average delays.
- Analyze the busiest flight routes.
- Understand flight delay categories.
- Monitor data quality and missing values.

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Databricks | Data engineering platform |
| SQL | Data transformation and analytics |
| Delta Tables | Structured data storage |
| Medallion Architecture | Data processing architecture |
| Databricks SQL Dashboard | Data visualization |
| GitHub | Version control and documentation |

## 🏗️ Project Architecture

The project follows the Medallion Architecture.

### Bronze Layer
- Ingests raw airline flight data.
- Preserves source information.
- Creates the initial Bronze table.

### Silver Layer
- Cleans and standardizes airline data.
- Handles missing airline names.
- Validates data fields.
- Creates the cleaned Silver table.

### Gold Layer
Creates five business analytics tables:

1. `gold_airline_performance`
2. `gold_route_performance`
3. `gold_flight_performance`
4. `gold_delay_analysis`
5. `gold_data_quality`

## 📊 Dashboard Preview

!(https://github.com/ravikumar1820/airline-flight-operations-analytics/blob/main/pipelines/dashboard/screenshots/airline_dashboard.png.png)

### Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Flights | 1,321 |
| On-Time Percentage | 68.28% |
| Weighted Average Delay | 25.1 minutes |
| Airlines Including Unknown | 6 |

### Dashboard Visualizations

- Total Flights by Airline
- Average Delay by Airline
- On-Time Percentage by Airline
- Airline Performance Details

## 🔍 Key Business Insights

- Sky Jet has the highest flight volume with 385 flights.
- Air Bharat operates 322 flights.
- Blue Wing operates 267 flights.
- Fly Easy has the highest on-time percentage at 71.51%.
- Coastal Air has the lowest average delay at 20.32 minutes.
- Eleven records have missing airline names and are categorized as `Unknown`.

## 🧹 Data Quality Management

Data quality checks are implemented to monitor:

- Missing values
- Duplicate candidate records
- Invalid ticket prices
- Invalid origin and destination combinations
- Gold table record counts

Missing airline names are retained under the `Unknown` category rather than deleting potentially useful flight records.

## 📁 Repository Structure

```text
airline-flight-operations-analytics/
│
├── architecture/
│   └── README.md
│
├── data/
│   └── README.md
│
├── dashboard/
│   └── screenshots/
│       ├── README.md
│       └── airline_dashboard.png
│
├── docs/
│   └── README.md
│
├── pipelines/
│   ├── 01_bronze.sql
│   ├── 02_silver.sql
│   ├── 03_gold.sql
│   ├── 04_data_quality.sql
│   └── README.md
│
└── README.md
```

## ⚙️ Project Execution Workflow

1. Upload the source airline dataset to Databricks.
2. Execute the Bronze ingestion pipeline.
3. Execute Silver cleaning and transformation operations.
4. Execute Gold analytical transformations.
5. Run data quality validation queries.
6. Connect Gold tables to Databricks SQL Dashboard.
7. Analyze airline performance and operational insights.

## 💡 Business Value

This project demonstrates how raw airline data can be transformed into structured analytical datasets and interactive dashboards.

It helps stakeholders understand airline performance, monitor delays, compare operational metrics, and identify areas requiring improvement.

## 👨‍💻 Author

**Ravi Kumar**

Data Analytics | SQL | Databricks | Data Engineering

GitHub: [https://github.com/ravikumar1820/airline-flight-operations-analytics]

---

⭐ If you find this project useful, consider giving this repository a star.
