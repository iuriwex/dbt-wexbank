with accounts as (
    select *
    from {{ ref('stg_eltool__accounts') }}
),
state as (
    select *
    from {{ ref('stg_eltool__customers') }}
)
select a.account_id,
    a.balance,
    c.customer_id,
    c.zipcode,
    c.city,
    c.state_code,
    s.state_name,
    c.datetime_created,
    c.datetime_updated,
    c.dbt_valid_from::TIMESTAMP as valid_from,
    CASE
        WHEN c.dbt_valid_to IS NULL THEN '9999-12-31'::TIMESTAMP
        ELSE c.dbt_valid_to::TIMESTAMP
    END as valid_to
from accounts a
    join customers c on c.customer_id = a.customer_id
    join state s on c.state_code = s.state_code