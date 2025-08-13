{% macro load_customers_data() %}
COPY INTO raw_customers_data
FROM @S3_STAGE/transformed_customers.csv
FILE_FORMAT = CSV_FORMAT;
{% endmacro %}