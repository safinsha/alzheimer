{{ config(materialized='view') }}

with base as (
    select
        `Subject ID` as subject_id,
        `MRI ID` as mri_id,
        upper(`Group`) as group_status,       
        cast(`Visit` as int64) as visit,
        cast(`MR Delay` as int64) as mr_delay,
        case
            when `MF` in ('M','Male') then 'Male'
            when `MF` in ('F','Female') then 'Female'
            else null
        end as sex,
        `Hand` as hand,
        cast(`Age`  as int64)  as age,
        cast(`EDUC` as int64)  as education_years,
        cast(`SES`  as int64)  as socio_economic_status,
        cast(`MMSE` as int64)  as mmse,
        cast(`CDR`  as float64) as cdr,
        cast(`eTIV` as int64)   as etiv,
        cast(`nWBV` as float64) as nwbv,
        cast(`ASF`  as float64) as asf
    from {{ source('alz','raw_oasis') }}
)

select *
from base
where subject_id is not null