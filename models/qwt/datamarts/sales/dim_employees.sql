{{config(materialized='view', schema = 'Salesmart')}}
select * from 
{{ ref('trf_employee') }}