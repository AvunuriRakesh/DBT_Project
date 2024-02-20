{{config(materialized='incremental',unique_key = 'OrderID')}}
select * from qwt.raw.orders
{% if is_incremental() %}
 where OrderDate >= (select max(OrderDate) from {{ this }})
{% endif %}
