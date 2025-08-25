with 

source as (

    select * from {{ source('alz', 'raw_oasis') }}

),

renamed as (

    select
        subject id,
        mri id,
        group,
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

    from source

)

select * from renamed
