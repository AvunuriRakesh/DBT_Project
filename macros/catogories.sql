{% macro get_prod_categories() -%}

{% set prod_categories_query %}
select distinct
CategoryName
from {{ ref('productcategories') }} 
order by 1
{% endset %}

{% set results = run_query(prod_categories_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}