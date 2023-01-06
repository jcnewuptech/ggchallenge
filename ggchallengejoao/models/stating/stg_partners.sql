{{ config(materialized='table') }}

select *
except
    (lead_sales_contact, created_at, updated_at),
    if(
        lead_sales_contact = '0', 'No contact', lead_sales_contact
    ) as lead_sales_contact,
    {{ unix_to_timestamp('created_at') }} as partner_created_at_timestamp,
    {{ unix_to_timestamp('updated_at') }} as partner_updated_at_timestamp
from {{ ref('partners') }}
