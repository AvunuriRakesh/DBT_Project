import snowflake.snowpark.functions as F
def model(dbt, session):
    dbt.config(materialized = "incremental",unique_key = 'OrderID')
    df = dbt.ref("stg_orders_py")

    if dbt.is_incremental:
        # only new rows compared to max in current table
        max_from_this = f"select max(OrderDate) from {dbt.this}"
        df = df.filter(df.OrderDate >= session.sql(max_from_this).collect()[0][0])

    return df