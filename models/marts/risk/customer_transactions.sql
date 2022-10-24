with transactions as (
    select *
    from {{ ref('fct_transactions') }}
),
accounts as (
    select *
    from {{ ref('dim_accounts') }}
),
customers as (
    select *
    from {{ ref('dim_customers') }}
)
select t.transaction_id,
    t.account_id,
    t.status,
    t.created_at,
    t.approved_at,
    c.zipcode as customer_zipcode,
    c.city as customer_city,
    c.state_code as customer_state_code,
    c.state_name as customer_state_name,
    c.coountry_code as customer_country_code
from transactions t
join accounts a on a.account_id = t.account_id
join customers c on a.customer_id = c.customer_id
   
