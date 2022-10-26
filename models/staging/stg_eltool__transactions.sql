with source as (
    select *
    from {{ source('warehouse', 'transactions') }}
),
renamed as (
    select transaction_id,
        account_id,
        status,
        created_at::TIMESTAMP,
        approved_at::TIMESTAMP
        from source
)
select *
from renamed
