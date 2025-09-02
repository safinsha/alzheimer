
{{ config(materialized='table') }}

with base as (select * from {{ ref('intermediate_ameli__compare_view') }}),

patients as (
  select year, patho_group, max(patients) as patients_year
  from base
  group by year, patho_group
),
spending as (
  select year, patho_group, sum(total_spending) as total_spending_year
  from base
  group by year, patho_group
)
select
  coalesce(p.year, s.year) as year,
  coalesce(p.patho_group, s.patho_group) as patho_group,
  p.patients_year,
  s.total_spending_year,
  safe_divide(s.total_spending_year, p.patients_year) as avg_cost_per_patient_year
from patients p
full join spending s
  on p.year = s.year and p.patho_group = s.patho_group
order by year, patho_group
