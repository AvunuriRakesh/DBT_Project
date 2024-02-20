{{config(materialized='view', schema = 'Salesmart')}}
select tc.*, d.DivisionName
from {{ ref('trf_customers') }} as tc 
inner join
{{ ref('divisions') }} as d
on tc.divisionid = d.divisionid