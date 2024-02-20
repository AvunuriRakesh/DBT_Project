{{config(materialized='table',schema = 'STAGING',alias = 'stg_customers')}}
select * from {{ source('raw', 'customers') }}