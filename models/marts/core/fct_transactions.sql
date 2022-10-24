with transactions as (
    select *
    from {{ ref('stg_eltool__transactions') }}
)
select * from transactions
