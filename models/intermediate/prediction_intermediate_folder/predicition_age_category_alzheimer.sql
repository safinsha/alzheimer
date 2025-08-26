
WITH ratio as
(WITH categ AS
(
  SELECT *,
CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS No_Alzheimer,
CASE WHEN age <60 THEN '50 - 60'
WHEN age < 70 THEN '60 - 70'
WHEN age < 80 THEN '80 - 90'
ELSE '90 +' END AS age_category


FROM
  {{ ref('stg_alz__raw_prediction') }})

  SELECT age_category, SUM(Alzheimer_Diagnosis) as Alzheimer_Diagnosis, SUM(No_Alzheimer) as No_Alzheimer,


 FROM categ  

 GROUP BY 1 )

 SELECT *, ROUND((Alzheimer_Diagnosis)/(Alzheimer_Diagnosis + No_Alzheimer),2) as ratio_alz

 FROM ratio