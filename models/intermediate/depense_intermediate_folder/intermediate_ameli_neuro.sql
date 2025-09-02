{{ config(materialized='view') }}

with base as (
  select
    `year`,
    patho_lvl3,
    total_spending,
    patients
  from {{ ref('stg_alz__raw_depense') }}
)

select
  `year`,
  case
    when lower(patho_lvl3) like '%démence%' or lower(patho_lvl3) like '%alzheimer%' then 'Démences/Alzheimer'
    when lower(patho_lvl3) like '%parkinson%'                                   then 'Maladie de Parkinson'
    when lower(patho_lvl3) like '%sclérose en plaques%'                          then 'Sclérose en plaques'
    when lower(patho_lvl3) like '%épilepsie%'                                    then 'Épilepsie'
    when lower(patho_lvl3) like '%myopathie%' or lower(patho_lvl3) like '%myasthénie%' then 'Myopathies / Myasthénies'
    when lower(patho_lvl3) like '%lésion médullaire%'                  then 'Lésion médullaire'
    when lower(patho_lvl3) like '%affections neurologiques%'                     then 'Autres affections neurologiques'
    else null
  end as patho_neuro,
  total_spending,
  patients
from base
where
  (
    lower(patho_lvl3) like '%démence%' or
    lower(patho_lvl3) like '%alzheimer%' or
    lower(patho_lvl3) like '%parkinson%' or
    lower(patho_lvl3) like '%sclérose en plaques%' or
    lower(patho_lvl3) like '%épilepsie%' or
    lower(patho_lvl3) like '%myopathie%' or 
    lower(patho_lvl3) like '%myasthénie%' or
    lower(patho_lvl3) like '%lésion médullaire%' or
    lower(patho_lvl3) like '%affections neurologiques%' 
  )
  and year between 2015 and 2023