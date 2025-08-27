SELECT (education_level/19) as education_level

, CASE WHEN income_level = 'Low' THEN 0
     WHEN income_level = 'Medium' THEN 1
     WHEN income_level ='High' THEN 2 END AS income_level

, CASE WHEN employment_status = 'Employed' THEN 1 ELSE 0 END AS employed
, Alzheimer_Diagnosis as alzheimer, CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer     


FROM {{ ref('stg_alz__raw_prediction') }}