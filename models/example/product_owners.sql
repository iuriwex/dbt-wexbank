
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table', schema='staging') }}

with source_data as (

    select 
        1 as id, 1 as product_id, 1 as owner_id
    union all
    select null as id, null as product_id, null as owner_id

)

select *
from source_data

-- added condition to avoud test failing
--where id is not null

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
