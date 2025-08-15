{{ config(
    materialized='table'
) }}

SELECT
    region,
    product_id,
    sum(TOTAL_SALES) as revenue,
    rank() over (partition by REGION order by sum(TOTAL_SALES) desc) as rank
FROM {{ref('fact_sales_north')}} 
GROUP BY region, product_id




