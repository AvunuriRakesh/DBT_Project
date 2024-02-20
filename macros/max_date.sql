{% macro max_date() -%}

{% set query %}
select 
max(orderdate)
from {{ ref('stg_orders') }}
{% endset %}
{% set results = run_query(query) %}
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% endif %}
{{ return(results_list) }}
{%- endmacro %}