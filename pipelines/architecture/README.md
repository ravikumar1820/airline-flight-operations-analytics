# Airline Analytics – Architecture

This project follows the Medallion Architecture.

## Bronze Layer
Raw airline data ingestion.

## Silver Layer
Data cleaning, standardization and validation.

## Gold Layer
Business-level aggregations and analytical tables.

## Data Flow

Bronze → Silver → Gold → Databricks SQL Dashboard
