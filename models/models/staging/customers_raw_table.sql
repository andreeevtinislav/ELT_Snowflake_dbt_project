{{config(
    materialized='table'
)}}

SELECT
product_id,
category,
brand,
rating
FROM {{source('staging_source', 'product_metadata_raw')}}