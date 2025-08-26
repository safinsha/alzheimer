WITH ratio_allele AS

(WITH genetic as
(SELECT *, CASE WHEN Genetic_Risk_Factor_APOE_e4_allele = 1 THEN 'presence' ELSE 'absence' END AS allele, 
CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer


FROM
  {{ ref('stg_alz__raw_prediction') }}
)

SELECT allele, SUM(Alzheimer_Diagnosis) as alzheimer, SUM(no_alzheimer) as no_alzheimer
FROM genetic

GROUP BY 1)

SELECT *, ROUND((alzheimer)/ (alzheimer + no_alzheimer),2) as ratio_alz
FROM ratio_allele