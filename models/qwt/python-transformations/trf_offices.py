def  model(dbt, session):
    dbt.config(materialized = "table",schema = 'transforming')
    df = dbt.ref("stg_offices")
    return df