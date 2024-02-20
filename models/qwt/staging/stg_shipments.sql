{{ config(materialized="table",schema = 'staging')}}
select 
orderid ,
lineno ,
shipperid ,
customerid ,
productid ,
Employeeid ,
TO_DATE(SPLIT_PART(ShipmentDate, ' ', 1), 'MM/DD/YYYY') AS ShipmentDate,
status 
from qwt.raw.shipments