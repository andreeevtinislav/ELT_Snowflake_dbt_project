{{config(
    materialized='table'
)}}

SELECT day, product_id revenue
FROM (
    SELECT DATE_TRUNC('day', DATE) AS day,
           product_id,
           SUM(TOTAL_SALES) AS revenue,
           RANK() OVER (PARTITION BY DATE_TRUNC('day', DATE) ORDER BY SUM(TOTAL_SALES) DESC) AS rnk
    FROM {{ref('fact_sales_north')}}
    GROUP BY day, product_id
) t
WHERE rnk = 1
ORDER BY day