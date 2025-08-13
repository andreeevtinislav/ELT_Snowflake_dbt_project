{% macro load_product_metadata_raw() %}
COPY INTO product_metadata_raw
FROM (
  SELECT
    $1:product_id::NUMBER,
    $1:category::STRING,
    $1:brand::STRING,
    $1:rating::NUMBER
  FROM @S3_STAGE/product_metadata.json (FILE_FORMAT => 'JSON_FORMAT')
)
{% endmacro %}