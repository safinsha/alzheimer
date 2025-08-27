WITH ratio AS
( WITH mental_1 AS
( SELECT high_depression, high_stress, isolated, (3 - high_depression + high_stress + isolated) as mental_health_score,alzheimer, no_alzheimer

FROM {{ ref('prediction_mental_health_step_1') }})

SELECT mental_health_score, SUM(alzheimer) as alzheimer, SUM(no_alzheimer) as no_alzheimer
FROM mental_1

GROUP BY mental_health_score
ORDER BY mental_health_score)

SELECT *, ROUND((alzheimer) / (alzheimer + no_alzheimer),2) as ratio_alz
FROM ratio