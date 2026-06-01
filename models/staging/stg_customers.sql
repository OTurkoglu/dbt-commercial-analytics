-- Staging: light cleaning and renaming of customer data
-- No business logic, 1:1 with source table

with source as (
    select
        id,
        first_name,
        last_name
    from {{ ref('src_customers') }}
),

cleaned as (
    select
        id::integer                     as customer_id,
        first_name::varchar             as first_name,
        last_name::varchar              as last_name,
        first_name || ' ' || last_name  as full_name
    from source
    where id is not null
)

select
    customer_id,
    first_name,
    last_name,
    full_name
from cleaned