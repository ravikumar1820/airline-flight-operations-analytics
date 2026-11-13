# Airline Analytics – Architecture

## Architecture Overview

This project follows the Medallion Architecture using Databricks.

### Bronze Layer
- Raw airline data ingestion.
- Initial data storage.

### Silver Layer
- Data cleaning and standardization.
- Missing-value handling.
- Data validation.

### Gold Layer
- Airline performance analytics.
- Route performance analytics.
- Flight performance analytics.
- Delay analysis.
- Data quality summary.

### Data Flow

Source Dataset → Bronze → Silver → Gold → Databricks SQL Dashboard
