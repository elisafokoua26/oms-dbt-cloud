
    SELECT
ORDERITEMID,
ORDERID,
PRODUCTID,
QUANTITY,
UnitPrice,
QUANTITY * UnitPrice AS TOTALPRICE,
UPDATED_AT
FROM
    {{ source('landing', 'orderitems')}}
