WITH calcul_score AS

(WITH step_bmi AS
(SELECT *, CASE WHEN bmi >=30 THEN 1 ELSE 0 END AS high_bmi, CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer

FROM {{ ref('stg_alz__raw_prediction') }} )





SELECT ROUND((age -50)/44,2) as age_normalised
, fam_history
, ROUND((100 - cognitive_test_score) / 70,2) as cognitive_risk
, Genetic_Risk_Factor_APOE_e4_allele as genetic_risk
, ROUND((diabetes + hypertension + high_bmi)/3,2) as comorbodity
, Alzheimer_Diagnosis as alzheimer
, no_alzheimer


FROM step_bmi )

SELECT *, ROUND(calcul_score.age_normalised + fam_history + calcul_score.cognitive_risk + calcul_score.genetic_risk + calcul_score.comorbodity,2) as global_all_risk
FROM calcul_score