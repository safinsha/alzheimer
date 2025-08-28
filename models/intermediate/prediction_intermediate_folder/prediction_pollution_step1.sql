SELECT distinct country, CASE WHEN country IN ('China', 'India', 'USA', 'Russia', 'Saudi Arabia', 'South Africa', 'South Korea', 'Japan', 'Germany', 'Brazil', 'Mexico')
 THEN 1 ELSE 0 END AS country_pollution ,

 CASE WHEN air_pollution_exposure = 'High'THEN 1 ELSE 0 END AS high_pollution_exposition,

 CASE WHEN stress_levels = 'High'THEN 1 ELSE 0 END AS high_stress,

 CASE WHEN urban_vs_rural = 'Urban' THEN 1 ELSE 0 END AS urban,

 Alzheimer_Diagnosis as alzheimer,

 CASE WHEN Alzheimer_Diagnosis = 0 THEN 1 ELSE 0 END AS no_alzheimer


FROM {{ ref('stg_alz__raw_prediction') }}