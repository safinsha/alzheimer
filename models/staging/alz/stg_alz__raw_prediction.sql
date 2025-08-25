with 

source as (

    select * from {{ source('alz', 'raw_prediction') }}

),

renamed as (

    select
<<<<<<< HEAD
        subject id,
        mri id,
        `group` AS groupe,
        visit,
        mr delay,
        mf,
        hand,
        age,
        educ,
        ses,
        mmse,
        cdr,
        etiv,
        nwbv,
        asf
=======
        country,
        age,
        gender,
        education_level,
        bmi,
        physical_activity_level,
        smoking_status,
        alcohol_consumption,
        diabetes,
        hypertension,
        cholesterol_level,
        fam_history,
        cognitive_test_score,
        depression_level,
        sleep_quality,
        dietary_habits,
        air_pollution_exposure,
        employment_status,
        marital_status,
        genetic_risk_factor_apoe_e4_allele,
        social_engagement_level,
        income_level,
        stress_levels,
        `urban_vs_rural living` as urban_vs_rural,
        alzheimer_diagnosis
>>>>>>> 3676b1f162db7a1386be4437bff3962fedc05bb0

    from source

)

select * from renamed
