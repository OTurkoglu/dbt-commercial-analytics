-- Intermediate: business logic and calculations
-- Joins customers and orders, computes order metrics per customer

with customers as (
    select
        customer_id,
        full_name
    from {{ ref('stg_customers') }}
),

orders as (
    select
        order_id,
        customer_id,
        order_date,
        order_status,
        order_amount
    from {{ ref('stg_orders') }}
),

order_metrics as (
    select
        customer_id,
        count(order_id)                                     as total_orders,
        sum(order_amount)                                   as total_revenue,
        avg(order_amount)                                   as avg_order_value,
        min(order_date)                                     as first_order_date,
        max(order_date)                                     as most_recent_order_date,
        count(case when order_status = 'completed'
              then order_id end)                            as completed_orders,
        count(case when order_status = 'returned'
              then order_id end)                            as returned_orders
    from orders
    group by customer_id
)

select
    c.customer_id,
    c.full_name,
    m.total_orders,
    m.total_revenue,
    m.avg_order_value,
    m.first_order_date,
    m.most_recent_order_date,
    m.completed_orders,
    m.returned_orders
from customers c
left join order_metrics m
    on c.customer_id = m.customer_id