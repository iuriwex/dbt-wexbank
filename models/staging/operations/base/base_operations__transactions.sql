with source as (
    
    select * from {{ source('operations', 'transactions') }}
    
),

renamed as (
    
    select
        transaction_id,
        customer_id,
        amount,
        status,
        convert_timezone('America/New_York', 'UTC', creation_date) as created_at    
    from source

)

select * from renamed