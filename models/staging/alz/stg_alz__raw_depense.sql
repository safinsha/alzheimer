with 

source as (

    select * from {{ source('alz', 'raw_depense') }}

),

renamed as (

    select
        CAST(annee AS INT64) AS `year`,
        CAST(patho_niv1 AS STRING) AS patho_lvl1,
        CAST(patho_niv2 AS STRING) AS patho_lvl2,
        CAST(patho_niv3 AS STRING) AS patho_lvl3,
        CAST(dep_niv_1 AS STRING) AS care_type,
        CAST(dep_niv_2 AS STRING) AS care_detail,
        CAST(montant AS INT64)AS total_spending,
        CAST(N_recourant_au_poste AS INT64)AS patients,
        CAST(montant_moy AS FLOAT64) AS avg_spending_per_patient

    from source

)

select * from renamed
