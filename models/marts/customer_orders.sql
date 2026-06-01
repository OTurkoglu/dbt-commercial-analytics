-- Mart: final business-facing customer orders table
-- Serves commercial and marketing teams for customer value analysis
-- All calculations handled upstream in intermediate layer

with customer_order_summary as (
    select
        customer_id,
        full_name,
        total_orders,
        total_revenue,
        avg_order_value,
        first_order_date,
        most_recent_order_date,
        completed_orders,
        returned_orders
    from {{ ref('int_customer_order_summary') }}
)

select
    customer_id,
    full_name,
    total_orders,
    total_revenue,
    avg_order_value,
    first_order_date,
    most_recent_order_date,
    completed_orders,
    returned_orders
from customer_order_summary