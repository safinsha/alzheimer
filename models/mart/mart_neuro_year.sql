{{ config(materialized='table') }}

with base as (select * from {{ ref('intermediate_ameli_neuro') }}),

patients as (
  -- éviter le double comptage : patients répétés par poste
  select year, patho_neuro, max(patients) as patients_year
  from base
  group by 1,2
),
spending as (
  select year, patho_neuro, sum(total_spending) as total_spending_year
  from base
  group by 1,2
)

select
  p.year,
  p.patho_neuro,
  p.patients_year,
  s.total_spending_year,
  safe_divide(coalesce(s.total_spending_year,0), nullif(p.patients_year,0))
    as avg_cost_per_patient_year
from patients p
join spending s using (year, patho_neuro)
order by year, patho_neuro
