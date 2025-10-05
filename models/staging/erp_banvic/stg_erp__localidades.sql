with
    fonte_localidades as (
        select *
        from {{ source('erp', 'localidades') }}
    )

    , renomeado as (
        select
            cast(cod_localidade as int) as pk_localidade
            , cast(cidade as varchar) as cidade
            , cast(uf as varchar) as uf
        from fonte_localidades
    )

select *
from renomeado
