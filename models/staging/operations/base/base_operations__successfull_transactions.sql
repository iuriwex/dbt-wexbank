with source as (
    
    select * from {{ source('staging', 'successfull_transactions') }}
    
),

renamed as (
    
    select
        transaction_id,
        customer_id,
        amount,
        convert_timezone('America/New_York', 'UTC', creation_date) as created_at    
    from source

    where status = 'true'

)

select * from renamed