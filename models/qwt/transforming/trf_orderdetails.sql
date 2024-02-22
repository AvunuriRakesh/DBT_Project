{{ config(materialized="table",schema = 'TRANSFORMING') }}
select od.* ,
(od.UNITPRICE*od.QUANTITY) - (1-od.DISCOUNT) as Linesalesamount,
(p.UNITCOST*od.QUANTITY) as costofgoodssold,
((od.UNITPRICE*od.QUANTITY) - (1-od.DISCOUNT) ) - (p.UNITCOST*od.QUANTITY) as margin
from {{ ref('stg_orderdetails') }} as od
inner join
{{ ref('products') }} p on od.PRODUCTID = p.PRODUCTID