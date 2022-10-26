{% snapshot accounts_snapshot %}

{{
    config(
      target_database='wexbank',
      target_schema='snapshots',
      unique_key='account_id',

      strategy='timestamp',
      updated_at='created_at',
    )
}}

select * from {{ source('warehouse', 'accounts') }}

{% endsnapshot %}
