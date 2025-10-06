with
    fonte_localidades as (
        select *
        from {{ source('erp', 'localidades') }}
    )

    , renomeado as (
        select
            cast(cod_localidade as int) as pk_localidade
            , cast(cidade as string) as cidade
            , cast(uf as string) as uf
        from fonte_localidades
    )

select *
from renomeado

