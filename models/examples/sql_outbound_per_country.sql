{{ config(materialized='view') }}

select
    referral_country as mart_referrals_referral_country,
    count(distinct referral_id) as mart_referrals_referral_total_count,
    avg(referral_days_from_creation) as mart_referrals_referral_avg_days_from_creation
from {{ ref('mart_referrals') }}
where ( ( (referral_status) in ('successful')) and ( (referral_outbound) in (0)))
group by 1
order by count(distinct referral_id) desc
