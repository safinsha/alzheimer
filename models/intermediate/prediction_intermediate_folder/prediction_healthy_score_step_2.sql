
with ratio_calcul as

(SELECT healthy_score, SUM(alzheimer) as alzheimer, SUM(no_alzheimer) as no_alzheimer

FROM {{ ref('prediction_healthy_score_step_1') }}

GROUP BY 1
ORDER BY 1)

SELECT *, ROUND((alzheimer)/(alzheimer + no_alzheimer),2) as ratio

FROM ratio_calcul

