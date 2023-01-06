{{ config(materialized='table') }}

select *
except
    (created_at, updated_at),
    {{ unix_to_timestamp('created_at') }} as referral_created_at_timestamp,
    {{ unix_to_timestamp('updated_at') }} as referral_updated_at_timestamp
from {{ ref('referrals') }}
