{{ config(
    materialized='table'
) }}
SELECT
    O.ORDERID,
    O.ORDERDATE,
    O.CUSTOMERID,
    O.EMPLOYEEID,
    O.STOREID,
    O.STATUSDESC,
    COUNT(DISTINCT O.ORDERID) AS ORDERCOUNT,
    SUM(OI.TOTALPRICE) AS REVENUE
FROM
    {{ ref('orders_stg') }} O
JOIN
    {{ ref('orderitems_stg') }} OI ON O.ORDERID = OI.ORDERID
GROUP BY
    O.ORDERID,
    O.ORDERDATE,
    O.CUSTOMERID,
    O.EMPLOYEEID,
    O.STOREID,
    O.STATUSDESC