{% macro load_sales_data() %}
COPY INTO raw_sales_data
FROM @S3_STAGE/sales_data.csv
FILE_FORMAT = (FORMAT_NAME = 'my_csv_format');
{% endmacro %}