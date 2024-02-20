{{config(materialized='view',schema='reporting')}}
with customers as (
    select 
    CUSTOMERID,
    COMPANYNAME,
    CONTACTNAME
    from {{ ref('dim_customers') }}
),
orders as (
    select 
    CUSTOMERID,
    min(ORDERDATE) as firstorderdate,
    max(ORDERDATE) as recentorderdate,
    count(LINESALESAMOUNT) as totalorders,
    sum(LINESALESAMOUNT) as total_sales
    from {{ ref('fct_orders') }}
    group by CUSTOMERID
),
final as (
    select 
    c.COMPANYNAME,
    c.CONTACTNAME,
    o.firstorderdate,
    o.recentorderdate,
    o.totalorders,
    o.total_sales
    from customers c 
     inner join orders o 
     on c.CUSTOMERID = o.customerid

)
select * from final