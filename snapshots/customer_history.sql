{% snapshot customer_history %}

{{
  config(
    target_schema='SNOWFLAKE_LEARNING_SCHEMA',
    unique_key='CUSTOMERID',
    strategy='timestamp',
    updated_at='updated_at'
  )
}}

SELECT * FROM {{ source('learningschema', 'customer') }}

{% endsnapshot %}