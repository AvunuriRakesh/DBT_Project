{{config(materialized='view',schema = 'Salesmart')}}
select 
o.orderid,
o.customerid,
o.employeeid,
od.productid,
od.lineno,
od.quantity,
od.unitprice,
od.discount,
od.LINESALESAMOUNT,
od.costofgoodssold,
od.margin,
o.FREIGHT,
o.orderdate
from 
{{ ref('stg_orders') }} o
inner join  {{ ref('trf_orderdetails') }} od on o.ORDERID = od.ORDERID
