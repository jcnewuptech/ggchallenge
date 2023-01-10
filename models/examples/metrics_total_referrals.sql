{{ config(materialized='view') }}


select *
from
    {{ metrics.calculate(
    metric('referral_total_count'),
    grain='month'
) }}
