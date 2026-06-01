-- Source: pull only necessary fields from raw customers table
-- This is the single entry point for customer data into the pipeline

select
    id,
    first_name,
    last_name,
    created_at
from {{ source('ecommerce', 'raw_customers') }}