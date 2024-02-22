def add_profit(x,y):
    return x-y

 
def model(dbt, session):
    dbt.config(materialized = "table",schema = 'transforming')
    product_df = dbt.ref("products")

    df = product_df.withColumn("profit",add_profit(product_df['UNITPRICE'],product_df['UNITCOST']))
    

    return df    
