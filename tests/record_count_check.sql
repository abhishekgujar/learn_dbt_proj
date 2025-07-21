-- tests/record_count_check.sql

{% set expected_counts = {
  'customer': 50,
  'employee': 20,
  'store': 10,
  'supplier': 5,
  'product': 100,
  'orderitem': 1000,
  'order': 200
} %}

SELECT *
FROM (

  {% for table, expected_count in expected_counts.items() %}
    SELECT
      '{{ table }}' AS table_name,
      COUNT(*) AS actual_count,
      {{ expected_count }} AS expected_count
    FROM {{ source('landing', table) }}
    HAVING COUNT(*) < {{ expected_count }}
    
    {% if not loop.last %}
      UNION ALL
    {% endif %}
  {% endfor %}

) as record_validation