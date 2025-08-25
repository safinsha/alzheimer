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

    from source

)

select * from renamed
