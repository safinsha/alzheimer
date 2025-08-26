
WITH calcul_all_risk AS
(WITH step_risk AS

(SELECT *, 
CASE WHEN global_all_risk <= 1 THEN 'very_low_risk'
 WHEN global_all_risk <= 3 THEN 'mid_risk'
 ELSE 'high_risk' END as risk_type
FROM {{ ref('prediction_global_risk_step_1') }}
)

SELECT risk_type, SUM(alzheimer) as alzheimer, SUM(no_alzheimer) as no_alzheimer

FROM step_risk

GROUP BY 1 )

SELECT *, ROUND((alzheimer)/(alzheimer + no_alzheimer),2) as ratio_alz
FROM calcul_all_risk

ORDER BY ratio_alz