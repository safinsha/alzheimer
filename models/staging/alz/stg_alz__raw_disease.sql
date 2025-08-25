with 

source as (

    select * from {{ source('alz', 'raw_disease') }}

),

renamed as (

    select
        patientid,
        age,
        gender,
        ethnicity,
        educationlevel,
        bmi,
        smoking,
        alcoholconsumption,
        physicalactivity,
        dietquality,
        sleepquality,
        familyhistoryalzheimers,
        cardiovasculardisease,
        diabetes,
        depression,
        headinjury,
        hypertension,
        systolicbp,
        diastolicbp,
        cholesteroltotal,
        cholesterolldl,
        cholesterolhdl,
        cholesteroltriglycerides,
        mmse,
        functionalassessment,
        memorycomplaints,
        behavioralproblems,
        adl,
        confusion,
        disorientation,
        personalitychanges,
        difficultycompletingtasks,
        forgetfulness,
        diagnosis,
        doctorincharge

    from source

)

select * from renamed
