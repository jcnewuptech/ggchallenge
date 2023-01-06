{% macro unix_to_timestamp(column_name) %}
timestamp_micros(cast({{ column_name }}/ 1000 as int64))
{% endmacro %}
