
-- Project: Airline Flight Operations Analytics
-- File: 04_data_quality.sql
-- Purpose: Data Quality Validation
-- Platform: Databricks SQL
-- Architecture: Medallion Architecture

-- 1. Total records in Silver
SELECT
    COUNT(*) AS total_records
FROM silver_flights_clean;


-- 2. Missing value validation
SELECT
    COUNT_IF(airline IS NULL OR TRIM(airline) = '')
        AS missing_airline,

    COUNT_IF(flight_number IS NULL OR TRIM(flight_number) = '')
        AS missing_flight_number,

    COUNT_IF(origin_city IS NULL OR TRIM(origin_city) = '')
        AS missing_origin_city,

    COUNT_IF(destination_city IS NULL OR TRIM(destination_city) = '')
        AS missing_destination_city,

    COUNT_IF(price IS NULL)
        AS missing_price

FROM silver_flights_clean;


-- 3. Duplicate flight candidate check
SELECT
    flight_number,
    origin_city,
    destination_city,
    COUNT(*) AS duplicate_count

FROM silver_flights_clean

GROUP BY
    flight_number,
    origin_city,
    destination_city

HAVING COUNT(*) > 1;


-- 4. Invalid price validation
SELECT *
FROM silver_flights_clean
WHERE price <= 0;


-- 5. Invalid route validation
SELECT *
FROM silver_flights_clean
WHERE origin_city = destination_city;


-- 6. Gold table record counts
SELECT 'Airline Performance' AS table_name,
       COUNT(*) AS total_records
FROM gold_airline_performance

UNION ALL

SELECT 'Route Performance', COUNT(*)
FROM gold_route_performance

UNION ALL

SELECT 'Flight Performance', COUNT(*)
FROM gold_flight_performance

UNION ALL

SELECT 'Delay Analysis', COUNT(*)
FROM gold_delay_analysis

UNION ALL

SELECT 'Data Quality', COUNT(*)
FROM gold_data_quality;
