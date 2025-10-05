with
    fonte_agencias as (
        select *
        from {{ source('erp', 'agencias') }}
    )

    , renomeado as (
        select
            cast(cod_agencia as int) as pk_agencia
            , cast(cod_localidade as int) as fk_localidade
            , cast(nome as varchar) as nome_agencia
            , cast(endereco as varchar) as endereco_agencia
            , cast(data_abertura as date) as data_de_abertura
            , cast(tipo_agencia as varchar) as tipo_agencia
        from fonte_agencias
    )

select *
from renomeado
