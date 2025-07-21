{{config(
    materialized='view'
)}}
SELECT 
    CUSTOMERID,
    FIRSTNAME,
    LASTNAME,
    CONCAT(FIRSTNAME, ' ', LASTNAME) AS CUSTOMERNAME,
    EMAIL,
    PHONE,
    ADDRESS,
    CITY,
    STATE,
    ZIPCODE,
    UPDATED_AT
FROM {{source('learningschema','customer')}}
