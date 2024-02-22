{{config(materialized='incremental',unique_key = ['OrderID','lineno'])}}
select od.*
from {{env_var('dbt_sourcedb','qwt')}}.{{env_var('dbt_sourceschema','raw')}}.order_details od
inner join {{ ref('stg_orders') }} o on od.OrderID = o.OrderID
{% if is_incremental() %}
 where o.OrderDate >= (select max(OrderDate) from {{ref('stg_orders')}}) 
{% endif %}