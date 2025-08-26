WITH ratio_allele AS

(

SELECT allele, SUM(Alzheimer_Diagnosis) as alzheimer, SUM(no_alzheimer) as no_alzheimer
FROM {{ ref('prediction_allele_genetic_factor_step1') }}

GROUP BY 1)

SELECT *, ROUND((alzheimer)/ (alzheimer + no_alzheimer),2) as ratio_alz
FROM ratio_allele