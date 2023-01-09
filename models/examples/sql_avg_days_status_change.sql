{{ config(materialized='view') }}


with
    calendar as (
        select *
        from
            unnest(
                generate_date_array('2020-01-01', '2021-12-01', interval 1 month)
            ) as record_date
    ),

    referrals as (
        select
            datetime_trunc(
                referral_updated, month
            ) as mart_referrals_referral_updated_month,
            avg(referral_days_from_creation) as avg_days_to_success
        from {{ ref('mart_referrals') }}
        where ( ( (referral_status) in ('successful')))
        group by 1
    )


select c.record_date, r.avg_days_to_success
from calendar c
left join
    referrals r on cast(c.record_date as datetime) = cast(
        r.mart_referrals_referral_updated_month as datetime
    )
