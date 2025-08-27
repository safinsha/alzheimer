{{ config(materialized='view') }}

with sub as
(select
  *,
  case
    when regexp_contains(lower(patho_lvl3), r'alzheim|d[ée]menc') then 'Alzheimer/Démences'
    when regexp_contains(lower(patho_lvl3), r'diab')              then 'Diabète'
    when regexp_contains(lower(patho_lvl3), r'cancer')            then 'Cancers'
    when regexp_contains(lower(patho_lvl3), r'cardio')            then 'Cardio'
    else null
  end as patho_group
from {{ ref('stg_alz__raw_depense') }})

select * from sub
where patho_group is not null
