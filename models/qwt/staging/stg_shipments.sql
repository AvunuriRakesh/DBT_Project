{{ config(materialized="table")}}
select 
orderid ,
lineno ,
shipperid ,
customerid ,
productid ,
Employeeid ,
TO_DATE(SPLIT_PART(ShipmentDate, ' ', 1), 'MM/DD/YYYY') AS ShipmentDate,
status 
from {{env_var('dbt_sourcedb','qwt')}}.{{env_var('dbt_sourceschema','raw')}}.shipments