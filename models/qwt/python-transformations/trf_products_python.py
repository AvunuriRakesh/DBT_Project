def add_profit(x,y):
    return x-y
def productavailability(a,b):
    if a-b > 0:
        return "True"
    else:
        return "False"
 
def model(dbt, session):
    dbt.config(materialized = "table",schema = 'transforming')
    product_df = dbt.ref("products")

    df = product_df.withColumn("profit",add_profit(product_df['UNITPRICE'],product_df['UNITCOST'])),
    df = product_df.withColumn("availability",productavailability(product_df['UNITSINSTOCK'],product_df['UNITSONORDER']))

    return df    
