{{ config(materialized='table')}}

select
    os.CUSTOMERID,
    c.CUSTOMERNAME,
    SUM(os.ORDERCOUNT) AS ORDERCOUNT,
    SUM(os.REVENUE) AS Revenue
    FROM 
        {{ref('orders_fact')}} os
    JOIN 
        {{ref('customers_stg')}} c ON os.CUSTOMERID = c.CUSTOMERID
    GROUP BY 
        os.CUSTOMERID,
        c.CUSTOMERNAME
