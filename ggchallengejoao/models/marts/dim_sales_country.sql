{{ config(materialized='view') }} select * from {{ ref('sales_people') }}
