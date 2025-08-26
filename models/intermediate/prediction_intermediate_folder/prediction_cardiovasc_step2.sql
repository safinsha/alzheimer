
WITH step_1 AS


(
SELECT risk_category, SUM(alzheimer) as alzheimer, SUM(no_alzheimer) as no_alzheimer

FROM {{ ref('prediction_cardiovasc_step1') }}

GROUP BY 1)

SELECT *, ROUND((alzheimer)/ (alzheimer + no_alzheimer),2) as ratio_risk

FROM step_1

ORDER BY ratio_risk