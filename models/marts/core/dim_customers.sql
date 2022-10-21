
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 
        1 as customer_id, 'Jhon Doe' as customer_name
        union all
    select 
        2 as customer_id, 'Mary Jane' as customer_name    
        union all
    select null as customer_id, null as customer_name    

)

select *
from source_data

/*
    Iuri 20221021
    added condition to avoud test failing
    Uncomment the line below to remove records with null `id` values
*/
-- where id is not null
