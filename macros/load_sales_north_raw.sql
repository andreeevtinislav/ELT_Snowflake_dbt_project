{% macro load_sales_north_raw() %}
COPY INTO sales_north_raw FROM @S3_STAGE/sales_north.csv
FILE_FORMAT = CSV_FORMAT
{% endmacro %}