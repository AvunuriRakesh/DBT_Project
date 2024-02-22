{{
    config(
        materialized = "view", schema = 'salesmart'
    )
}}
{% set mindate = min_date() %}
{% set maxdate = max_date() %}
{{ dbt_date.get_date_dimension( mindate
,maxdate
) }}