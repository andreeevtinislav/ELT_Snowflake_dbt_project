{{config(
    materialized='table'
)}}

SELECT
    REGION,
    CATEGORY,
    sum(TOTAL_SALES) as total_sales
FROM {{ref('fact_sales_north')}} as fn
JOIN {{ref('dim_customers')}} dc ON fn.PRODUCT_ID = dc.PRODUCT_ID
GROUP BY REGION, CATEGORY
