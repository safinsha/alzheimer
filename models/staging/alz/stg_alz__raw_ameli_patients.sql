with 

source as (

    select * from {{ source('alz', 'raw_ameli_patients') }}

),

renamed as (

    select
        annee,
        patho_niv1,
        patho_niv2,
        patho_niv3,
        cla_age_5,
        sexe,
        region,
        dept,
        ntop,
        npop,
        prev,
        `niveau prioritaire` as niveau_prioritaire ,
        libelle_classe_age,
        libelle_sexe,
        tri

    from source

)

select * from renamed
