{{ config(
    materialized='view'
) }}

SELECT
    customerid,
    customername,
    ordercount,
    revenue,
    dbt_valid_from
FROM
    {{ ref('customerrevenue_pipeline_snapshot') }}
WHERE
    dbt_valid_to IS NULL
