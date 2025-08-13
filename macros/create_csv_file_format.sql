{% macro create_csv_file_format() %}
CREATE FILE FORMAT CSV_FORMAT
TYPE = 'CSV'
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1
;
{% endmacro %}