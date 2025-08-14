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
FROM {{source('staging_source', 'sales_north_raw')}} 
