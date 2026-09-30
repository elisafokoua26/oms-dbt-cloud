SELECT 
    o.ORDERID,
    o.ORDERDATE,
    o.CUSTOMERID,
    o.EMPLOYEEID,
    o.STOREID,
    o.StatusCD,
    o.StatusDesc,
    count(distinct o.ORDERID) AS OrderCount,
    sum(oi.TotalPrice) AS Revenue,
    o.UPDATED_AT
FROM 
    {{ ref('orders_stg')}} o 
join 
    {{ ref('orderitems_stg')}} oi ON o.ORDERID = oi.ORDERID
GROUP BY 1,2,3,4,5,6,7,10