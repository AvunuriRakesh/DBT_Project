{{config(materialized='table',
enabled=true,  alias = 'stg_customers')}}
select * from {{env_var('dbt_sourcedb','qwt')}}.{{env_var('dbt_sourceschema','raw')}}.customers