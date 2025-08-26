
WITH step_4 AS

(WITH step_3 AS

(WITH step_2 AS

(WITH step_1 AS

(
  SELECT ROUND((age/100),3) as age_normalised , ROUND((bmi/40),3) as bmi_normalised, diabetes,  
  
  CASE WHEN cholesterol_level = 'High'THEN 1 ELSE 0 END AS cholesterol_high, 

Alzheimer_Diagnosis as alzheimer,

CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer


FROM
  {{ ref('stg_alz__raw_prediction') }} )

SELECT *, ROUND((step_1.age_normalised + step_1.bmi_normalised + step_1.cholesterol_high + diabetes ),3) as cardio_risk
FROM step_1 
)

SELECT *, CASE WHEN step_2.cardio_risk < 1.5 THEN 'very weak'

 WHEN step_2.cardio_risk < 2.5 THEN 'weak'

 WHEN step_2.cardio_risk < 3.5 THEN 'normal'

 WHEN step_2.cardio_risk < 4.5 THEN 'high'

ELSE 'very high' END AS risk_category

FROM step_2)

SELECT risk_category, SUM(alzheimer) as alzheimer, SUM(no_alzheimer) as no_alzheimer

FROM step_3

GROUP BY 1)

SELECT *, ROUND((step_4.alzheimer)/ (step_4.alzheimer + step_4.no_alzheimer),2) as ratio_risk

FROM step_4

ORDER BY ratio_risk