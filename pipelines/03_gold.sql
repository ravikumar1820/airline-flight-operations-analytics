-- Project: Airline Flight Operations Analytics
-- Layer: Gold
-- Purpose: Business aggregations and analytics
-- Platform: Databricks SQL
-- Architecture: Medallion Architecture

-- Gold tables:
-- 1. gold_airline_performance
CREATE OR REFRESH MATERIALIZED VIEW gold_airline_performance AS

SELECT
    airline,

    COUNT(*) AS total_flights,

    COUNT(DISTINCT flight_number) AS unique_flights,

    ROUND(AVG(delay_minutes), 2)
        AS avg_delay_minutes,

    SUM(CASE
        WHEN delay_minutes <= 15 THEN 1
        ELSE 0
    END) AS on_time_flights,

    ROUND(
        100.0 * SUM(CASE
            WHEN delay_minutes <= 15 THEN 1
            ELSE 0
        END) / COUNT(*), 2
    ) AS on_time_percentage

FROM silver_flights_clean

GROUP BY airline;
-- 2. gold_route_performance
CREATE OR REFRESH MATERIALIZED VIEW gold_route_performance AS

SELECT
    origin_city,
    destination_city,

    COUNT(*) AS total_flights,

    ROUND(AVG(avg_fare), 2) AS avg_ticket_price,

    ROUND(AVG(delay_minutes), 2)
        AS avg_delay_minutes,

    COUNT(DISTINCT airline) AS airlines_operating

FROM silver_flights_clean

GROUP BY ALL;

-- 3. gold_flight_performance
CREATE OR REFRESH MATERIALIZED VIEW gold_flight_performance AS

SELECT
    airline,
    flight_number,
    origin_city,
    destination_city,

    COUNT(*) AS total_records,

    ROUND(AVG(delay_minutes), 2)
        AS avg_delay_minutes,

    ROUND(AVG(avg_fare), 2)
        AS avg_price

FROM silver_flights_clean

GROUP BY ALL;
-- 4. gold_delay_analysis
CREATE OR REFRESH MATERIALIZED VIEW gold_delay_analysis AS

SELECT

    CASE
        WHEN delay_minutes <= 0 THEN 'On Time / Early'
        WHEN delay_minutes <= 15 THEN 'Minor Delay'
        WHEN delay_minutes <= 60 THEN 'Moderate Delay'
        ELSE 'Major Delay'
    END AS delay_category,

    COUNT(*) AS total_flights,

    ROUND(AVG(delay_minutes), 2)
        AS avg_delay_minutes,

    ROUND(MAX(delay_minutes), 2)
        AS maximum_delay_minutes

FROM silver_flights_clean

GROUP BY ALL;

-- 5. gold_data_quality
CREATE OR REFRESH MATERIALIZED VIEW gold_data_quality AS

SELECT

    COUNT(*) AS total_records,

    COUNT_IF(airline IS NULL)
        AS missing_airline,

    COUNT_IF(flight_number IS NULL)
        AS missing_flight_number,

    COUNT_IF(origin_city IS NULL)
        AS missing_origin_city,

    COUNT_IF(destination_city IS NULL)
        AS missing_destination_city,

    COUNT_IF(avg_fare IS NULL)
        AS missing_avg_fare,

    COUNT_IF(delay_minutes < 0)
        AS negative_delay

FROM silver_flights_clean;    
