{{config(
    materialized='view'
)}}
SELECT
    ORDERID,
    ORDERDATE,
    CUSTOMERID,
    EMPLOYEEID,
    STOREID,
    STATUS AS STATUSCD,
    CASE
        WHEN STATUS = '01' THEN 'IN PROGRESS'
        WHEN STATUS = '02' THEN 'COMPLETED'
        WHEN STATUS = '03' THEN 'CANCELLED'
        ELSE NULL
    END AS STATUSDESC,
    UPDATED_AT
FROM
    {{source('learningschema', 'order')}}