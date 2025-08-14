WITH sales_by_region AS (SELECT *
                         FROM {{ref('sales_by_region')}})
SELECT *
FROM sales_by_region
WHERE TOTAL_SALES < 0