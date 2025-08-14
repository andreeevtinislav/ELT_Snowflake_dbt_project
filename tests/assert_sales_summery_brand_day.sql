WITH sales_summary_brand_day AS (SELECT *
                                   FROM {{ref('sales_summary_brand_day')}})
SELECT *
FROM sales_summary_brand_day
WHERE day > 31