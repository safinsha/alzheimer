WITH ratio AS

(WITH diabete_data AS

(SELECT *, CASE WHEN diabetes = 1 THEN 'diabetic' ELSE 'non diabetic' END AS diabete, 
CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer


FROM
  {{ ref('stg_alz__raw_prediction') }}
)

SELECT diabete, SUM(Alzheimer_Diagnosis) as alzheimer, SUM(no_alzheimer) AS no_alzheimer

FROM diabete_data

GROUP BY diabete )

SELECT *, ROUND((alzheimer)/(alzheimer + no_alzheimer ),2) as ratio_alz

from ratio