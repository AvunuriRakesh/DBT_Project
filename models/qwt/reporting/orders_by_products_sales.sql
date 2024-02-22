--by using jinja 
{{config(materialized='view',schema='reporting')}}
{% set linenos = get_order_lines() %}
select orderid,
{% for lineno in linenos %}
nvl(sum(case when LINENO = {{lineno}} then (QUANTITY*UNITPRICE) end),0)  as lineno_{{lineno}}_amount,
{% endfor %}
sum(QUANTITY*UNITPRICE) as total_order_amount
from
{{ ref('stg_orderdetails') }}  
group by 1


--write the SQL without jinja
/*
{{config(materialized='view',schema='reporting')}}
select orderid,
nvl(sum(case when LINENO =1 then (QUANTITY*UNITPRICE) end),0)  as lineno_1_amount,
nvl(sum(case when LINENO =2 then (QUANTITY*UNITPRICE) end),0)  as lineno_2_amount,
nvl(sum(case when LINENO =3 then (QUANTITY*UNITPRICE) end),0)  as lineno_3_amount,
sum(QUANTITY*UNITPRICE) as total_order_amount
from
{{ ref('stg_orderdetails') }}  
group by 1
*/