{{config(
    materialized='table'
)}}

SELECT
    sales_id,
    product_id,
    coalesce(initcap(region), 'Unknown') as region,
    quantity,
    price,
    to_date(timestamp, 'YYYY-MM-DD HH24:MI:SS') as date,
    total_sales
FROM {{ ref('sales_north_raw_table') }}
WHERE price >= 0 AND total_sales >=0 AND quantity >= 0
ORDER BY sales_id