with
    fonte_localidades as (
        
        SELECT * FROM {{ source('erp', 'localidades') }}

    )


  ,renomeado as (

    SELECT 
        cod_localidade as pk_localidade
        ,CAST(cidade as string) as cidade
        ,CAST(uf as string) as UF
    FROM fonte_localidades

)

SELECT * FROM renomeado

