{{ config(
    materialized='table')
    }}

SELECT
    order_id,
    customer_id,
    amount,
    quantity,
    TO_DATE(order_date, 'YYYY-MM-DD') AS order_date
FROM raw_sales_data
