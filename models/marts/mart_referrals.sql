{{ config(materialized='table') }}

select
    r.id as referral_id,
    r.company_id as referral_company,
    r.partner_id as referral_partner,
    r.status as referral_status,
    r.is_outbound as referral_outbound,
    r.referral_created_at_timestamp as referral_record_date,
    r.referral_updated_at_timestamp as referral_updated,
    nullif(
        timestamp_diff(
            referral_updated_at_timestamp, referral_created_at_timestamp, day
        ),
        0
    ) as referral_days_from_creation,
    p.partner_type as referral_partner_type,
    case
        when p.lead_sales_contact = '0' then 'No contact' else p.lead_sales_contact
    end as referral_lead_sales_contact,
    coalesce(d.country, 'No country') as referral_country
from {{ ref('stg_referrals') }} r
left join {{ ref('stg_partners') }} p on r.partner_id = p.id
left join {{ ref('sales_people') }} d on p.lead_sales_contact = d.name
