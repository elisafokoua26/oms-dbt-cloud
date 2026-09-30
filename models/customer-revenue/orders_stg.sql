SELECT
    ORDERID,
    ORDERDATE,
    CUSTOMERID,
    EMPLOYEEID,
    STOREID,
    STATUS AS StatusCD,
    CASE
        WHEN STATUS = '01' THEN 'In Progress'
        WHEN STATUS = '02' THEN 'Completed'
        WHEN STATUS = '03' THEN 'Cancelled'
        ELSE Null
    END AS StatusDesc,
    case
        when STOREID = 1000 then 'online'
        else 'In-store'
    end as ORDER_CHANNEL,
    UPDATED_AT,
    current_timestamp as dbt_updated_at
FROM 
    {{ source('landing','orders')}}