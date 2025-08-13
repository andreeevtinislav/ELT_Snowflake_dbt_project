{{config(
    materialized='table'
)}}

SELECT
product_id,
category,
brand,
rating
FROM product_metadata_raw