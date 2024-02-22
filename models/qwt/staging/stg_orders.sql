{{config(materialized='incremental',unique_key = 'OrderID')}}
select * from {{env_var('dbt_sourcedb','qwt')}}.{{env_var('dbt_sourceschema','raw')}}.orders
{% if is_incremental() %}
 where OrderDate >= (select max(OrderDate) from {{ this }})
{% endif %}
