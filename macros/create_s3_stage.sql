{% macro create_s3_stage() %}
CREATE STAGE S3_STAGE
    URL = 's3://engineering-class/'
    CREDENTIALS = (AWS_KEY_ID = 'ENTER_YOUR_AWS_KEY_ID' AWS_SECRET_KEY = 'ENTER_YOUR_AWS_SECRET_KEY')
    FILE_FORMAT = CSV_FORMAT
;
{% endmacro %}