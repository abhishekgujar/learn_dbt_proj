SELECT
    city_code,
    city,
    month,
    avg_temp_fahrenheit,
    {{to_celsius('avg_temp_fahrenheit', 2)}} AS avg_temp_celsius
FROM {{source('learningschema','city_temperature')}}
