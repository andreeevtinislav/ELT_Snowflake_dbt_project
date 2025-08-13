{{% macro create_json_file_format() %}}
CREATE OR REPLACE FILE FORMAT JSON_FORMAT
TYPE = 'JSON'
STRIP_OUTER_ARRAY = TRUE
{{% endmacro %}}