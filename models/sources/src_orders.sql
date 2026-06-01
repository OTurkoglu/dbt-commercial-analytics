-- Source: pull only necessary fields from raw orders table
-- This is the single entry point for orders data into the pipeline

select
    id,
    user_id,
    order_date,
    status,
    amount
from {{ source('ecommerce', 'raw_orders') }}