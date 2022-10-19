{% exist_product(model, column_name) %}

with validation as (

    select
        {{ column_name }} as id

    from {{ model }}

),

validation_errors as (

    select
        id

    from validation
    -- if this is true, then even_field is actually odd!
    where name = 'BOCA1'

)

select *
from validation_errors

{% endtest %}