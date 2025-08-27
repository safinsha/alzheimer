SELECT CASE WHEN depression_level = 'High' THEN 1 ELSE 0 END AS high_depression,

CASE WHEN stress_levels = 'High' THEN 1 ELSE 0 END AS high_stress,

 CASE WHEN marital_status = 'Single' AND social_engagement_level = 'Low' THEN 1 ELSE 0 END AS isolated,

 Alzheimer_Diagnosis as alzheimer, CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer


FROM {{ ref('stg_alz__raw_prediction') }}