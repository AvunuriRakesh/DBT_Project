--by using jinja 
{{config(materialized='view',schema='reporting')}}
{% set prodcategories = get_prod_categories() %}
select od.orderid,
{% for categoryname in prodcategories %}
nvl(sum(case when  pc.CATEGORYNAME  = '{{escape_single_quotes(categoryname)}}' then (od.QUANTITY*od.UNITPRICE) end),0)  as "{{categoryname}}",
{% endfor %}
sum(od.QUANTITY*od.UNITPRICE) as total_order_amount
from
{{ ref('stg_orderdetails') }}  as od 
inner join {{ ref('products') }} as p on od.PRODUCTID= p.PRODUCTID
inner join {{ ref('productcategories') }} as pc on pc.CATEGORYID= p.CATEGORYID
group by 1