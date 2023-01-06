{{ config(materialized='table') }}

select
    r.company_id as referral_company,
    r.partner_id as referral_partner,
    r.status as referral_status,
    r.is_outbound as referral_outbound,
    r.referral_created_at_timestamp as referral_record_date,
    r.referral_updated_at_timestamp as referral_updated,
    timestamp_diff(
        referral_updated_at_timestamp, referral_created_at_timestamp, day
    ) as referral_days_from_creation,
    p.partner_type as referral_partner_type,
    p.lead_sales_contact as referral_lead_sales_contact,
    coalesce(d.country, 'No country') as referral_country
from {{ ref('stg_referrals') }} r
left join {{ ref('partners') }} p on r.partner_id = p.id
left join {{ ref('sales_people') }} d on p.lead_sales_contact = d.name
