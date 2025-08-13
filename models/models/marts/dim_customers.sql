{{config(
    materialized='table'
)}}


SELECT
    PRODUCT_ID,
    CATEGORY,
    substr(BRAND,6) as brand_name,
    RATING

FROM {{ ref('customers_raw_table') }}
