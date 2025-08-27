
WITH final AS
(WITH ratio AS

( WITH st_1 AS

(SELECT education_level + income_level + employed as socio_score, alzheimer, no_alzheimer

FROM {{ ref('prediction_socioeco_step_1') }})

SELECT socio_score, SUM(alzheimer) as alzheimer, SUM(no_alzheimer) AS no_alzheimer

, CASE WHEN socio_score <= 3.5 THEN 'poor' ELSE 'good' END AS status
FROM st_1

GROUP BY 1 )

SELECT status, SUM(alzheimer) as alzheimer, SUM(no_alzheimer) AS no_alzheimer
FROM ratio 

GROUP BY status)

SELECT *, ROUND((alzheimer)/(alzheimer + no_alzheimer),2) AS ratio_alz
FROM final