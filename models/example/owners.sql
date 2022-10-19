
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id, 'John' as first_names, 'Doe' as last_name, now() as modified_date
    union all
    select null as id, '' as first_names, '' as last_name, now() as modified_date

)

select *
from source_data

-- added condition to avoud test failing
--where id is not null

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
