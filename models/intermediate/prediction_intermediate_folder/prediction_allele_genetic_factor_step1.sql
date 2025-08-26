
SELECT *, CASE WHEN Genetic_Risk_Factor_APOE_e4_allele = 1 THEN 'presence' ELSE 'absence' END AS allele, 
CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer


FROM
  {{ ref('stg_alz__raw_prediction') }}


