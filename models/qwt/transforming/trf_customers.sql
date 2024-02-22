{{config(materialized = 'table', schema = 'TRANSFORMING') }}
 
select
customerid,
companyname,
contactname,
city,
country,
divisionid,
address,
fax,
phone,
substr(postalcode, 1, 5) as zipcode,
CASE WHEN COALESCE(StateProvince,'')='' THEN 'NA' ELSE StateProvince END AS STATE
from
{{ ref('customers') }}