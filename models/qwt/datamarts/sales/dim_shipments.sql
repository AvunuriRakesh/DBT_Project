{{config(materialized='view',schema= 'salesmart') }}
select 
ss.orderid,
ss.lineno,
ss.shipperid,
s.companyname as shipmentcompany,
ss.ShipmentDate,
ss.status,
ss.valid_from,
ss.valid_to
from
{{ ref('shipments_snapshot') }} as ss
inner join
{{ ref('shippers') }} as s 
on ss.shipperid = s.shipperid