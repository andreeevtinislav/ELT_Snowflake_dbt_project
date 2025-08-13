{{config(
    materialized='table'
)}}
SELECT
    sales_id,
    product_id,
    region,
    quantity,
    price,
    timestamp,
    total_sales
FROM SALES_NORTH_RAW
