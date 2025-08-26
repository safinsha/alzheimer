
WITH ratio as
(
  SELECT age_category, SUM(Alzheimer_Diagnosis) as Alzheimer_Diagnosis, SUM(No_Alzheimer) as No_Alzheimer,


 FROM {{ ref('predicition_age_category_alzheimer_step1') }}  

 GROUP BY 1 )

 SELECT *, ROUND((Alzheimer_Diagnosis)/(Alzheimer_Diagnosis + No_Alzheimer),2) as ratio_alz

 FROM ratio