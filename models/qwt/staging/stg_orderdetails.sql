{{config(materialized='incremental',unique_key = ['OrderID','lineno'])}}
select od.*
from qwt.raw.order_details od
inner join {{ ref('stg_orders') }} o on od.OrderID = o.OrderID
{% if is_incremental() %}
 where o.OrderDate >= (select max(o.OrderDate) from {{ref('stg_orders')}}) 
{% endif %}