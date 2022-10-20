{% macro test_exist_product(model, column_name) %}

with validation as (

    select
        {{ column_name }} as name
    from {{ model }}

),

validation_errors as (

    select
        name
    from validation
    -- if this is true, then even_field is actually odd!
    where name = 'BOCA1'

)

select *
from validation_errors

{% endmacro %}