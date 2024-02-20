{{config(materialized='table', schema = 'staging')}}
select * 
from {{ source('raw', 'employees') }}