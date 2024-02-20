{{
    config(
        materialized='table',schema = 'staging'
    )
}}
select * from qwt.raw.orders