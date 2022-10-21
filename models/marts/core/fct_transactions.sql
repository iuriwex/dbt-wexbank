
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 
        1 as transaction_id, 1.333 as amount, 1 as customer_id. 'false' as status
        union all
    select 
        2 as transaction_id, 2.666 as amount, 2 as customer_id, 'true' as status
        union all
    select null as transaction_id, null as ammount, null as customer_id, null as status

)

select *
from source_data

-- added condition to avoud test failing
--where id is not null

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
