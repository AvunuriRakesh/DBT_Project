{{config(materialized='view',schema='reporting')}}
select 
e.EMPID as EMPID,
e.FIRST_NAME AS FIRST_NAME,
date_part('month', f.orderdate) as order_month,
date_part('year', f.orderdate) as order_year,
sum(f.LINESALESAMOUNT) as totalsales,
avg(f.margin) as margin
from 
{{ ref('stg_employees') }} e
inner join {{ ref('fct_orders') }} f on f.employeeid = e.EMPID
inner join {{ ref('stg_offices') }}  o on e.OFFICE = o.OFFICEID
where o.OFFICECITY= '{{var('city')}}'
group by EMPID,FIRST_NAME ,order_month,order_year
