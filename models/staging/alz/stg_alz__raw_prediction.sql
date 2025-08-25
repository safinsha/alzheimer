with 

source as (

    select * from {{ source('alz', 'raw_prediction') }}

),

renamed as (

    select
        country,
        age,
        gender,
        education_level,
        bmi,
        physical_activity_level,
        smoking_status,
        alcohol_consumption,
        CASE WHEN diabetes = false THEN 0 ELSE 1 END as diabetes,
        CASE WHEN hypertension = false THEN 0 ELSE 1 END as hypertension,
        cholesterol_level,
        CASE WHEN fam_history = false THEN 0 ELSE 1 END as fam_history,
        cognitive_test_score,
        depression_level,
        sleep_quality,
        dietary_habits,
        air_pollution_exposure,
        employment_status,
        marital_status,
        CASE WHEN Genetic_Risk_Factor_APOE_e4_allele = false THEN 0 ELSE 1 END as Genetic_Risk_Factor_APOE_e4_allele,
        social_engagement_level,
        income_level,
        stress_levels,
        `urban_vs_rural living` as urban_vs_rural,
        CASE WHEN Alzheimer_Diagnosis = false THEN 0 ELSE 1 END as Alzheimer_Diagnosis

    from source

)

select * from renamed
