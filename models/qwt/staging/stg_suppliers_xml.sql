{{config(materialized='table',schema= 'staging') }}
select * from {{env_var('dbt_sourcedb','qwt')}}.{{env_var('dbt_sourceschema','raw')}}.SUPPLIERS_XML
