{{config(materialized='view', schema = 'salesmart')}}
select 
p.*,
s.companyname,
s.contactname,
s.country,
s.city,
c.categoryname
from {{ ref('trf_products') }} as p 
inner join
{{ ref('trf_suppliers') }} as s
on p.SupplierID = s.SupplierID
inner join
{{ ref('productcategories') }} c
on c.categoryId = p.categoryId