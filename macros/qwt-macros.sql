{% macro get_order_lines() -%}

{% set order_linenos_query %}
select distinct
lineno
from {{ ref('stg_orderdetails') }}
order by 1
{% endset %}

{% set results = run_query(order_linenos_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}