{% macro test_is_not_null(model) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

select coutn(*)
from {{ model }}
WHERE {{ column_name }} is null


{% endmacro %}