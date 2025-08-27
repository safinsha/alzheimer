{{ config(materialized='view') }}
select * 
from {{ ref('stg_alz__raw_depense') }}
where lower(patho_lvl3) like '%alzheim%'
   or lower(patho_lvl3) like '%démence%'
   or lower(patho_lvl3) like '%demence%'