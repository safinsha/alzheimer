-- KPI Alzheimer par année
{{ config(materialized='table') }}

with base as (select * from {{ ref('intermediate_ameli__alz_view') }}),

patients as (
  select year, max(patients) as patients_year
  from base
  group by year
),
spending as (
  select year, sum(total_spending) as total_spending_year
  from base
  group by year
)
select
  p.year,
  p.patients_year,
  s.total_spending_year,
  safe_divide(s.total_spending_year, p.patients_year) as avg_cost_per_patient_year
from patients p
join spending s using (year)
order by year
