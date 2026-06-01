-- Staging: light cleaning and renaming of orders data
-- No business logic, 1:1 with source table

with source as (
    select
        id,
        user_id,
        order_date,
        status,
        amount
    from {{ ref('src_orders') }}
),

cleaned as (
    select
        id::integer             as order_id,
        user_id::integer        as customer_id,
        order_date::date        as order_date,
        status::varchar         as order_status,
        amount::decimal(10,2)   as order_amount
    from source
    where id is not null
      and user_id is not null
)

select
    order_id,
    customer_id,
    order_date,
    order_status,
    order_amount
from cleaned