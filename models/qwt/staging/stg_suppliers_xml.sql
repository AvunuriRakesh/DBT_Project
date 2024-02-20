{{config(materialized='table',schema= 'staging') }}
select * from qwt.raw.SUPPLIERS_XML
