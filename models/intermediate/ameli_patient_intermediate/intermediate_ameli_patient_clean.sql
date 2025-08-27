WITH sub AS
( SELECT 
annee, libelle_classe_age, libelle_sexe, region, dept, Ntop, Npop, prev


FROM {{ ref('stg_alz__raw_ameli_patients') }})

SELECT * FROM sub
WHERE libelle_sexe <> 'tous sexes' AND libelle_classe_age <> 'tous âges'