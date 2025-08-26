WITH score_calcul AS
(
SELECT CASE WHEN physical_activity_level = 'High' THEN 1 ELSE 0 END AS physical_activity

, CASE WHEN smoking_status = 'Never' THEN 1 ELSE 0 END AS never_smoked

, CASE WHEN alcohol_consumption = 'Never' THEN 1 ELSE 0 END AS no_alcohol

, CASE WHEN dietary_habits = 'Healthy' THEN 1 ELSE 0 END AS healthy

, Alzheimer_Diagnosis as alzheimer

, CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer



FROM {{ ref('stg_alz__raw_prediction') }} )

SELECT physical_activity, never_smoked, no_alcohol, healthy
, (physical_activity + never_smoked + no_alcohol + healthy ) as healthy_score, alzheimer, no_alzheimer

FROM score_calcul