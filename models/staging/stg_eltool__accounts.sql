with source as (
    select *
    from {{ ref('accounts_snapshot') }}
), renamed as (
    select account_id,
        customer_id,
        balance,
        status,
        created_at::TIMESTAMP AS datetime_created,
    from source
)
select *
from renamed
