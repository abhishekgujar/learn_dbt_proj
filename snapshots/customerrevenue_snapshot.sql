{% snapshot customerrevenue_pipeline_snapshot %}
{{
    config(
      target_schema='SNOWFLAKE_LEARNING_SCHEMA',
      unique_key='customerid',
      strategy='check',
      check_cols=['customername', 'ordercount', 'revenue']
    )
}}

SELECT
    OS.CUSTOMERID AS customerid,
    C.CUSTOMERNAME AS customername,
    SUM(OS.ORDERCOUNT) AS ordercount,
    SUM(OS.REVENUE) AS revenue
FROM
    {{ ref('orders_fact') }} OS
JOIN
    {{ ref('customer_stg') }} C ON OS.CUSTOMERID = C.CUSTOMERID
GROUP BY
    OS.CUSTOMERID,
    C.CUSTOMERNAME

{% endsnapshot %}