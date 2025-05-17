with
    fonte_agencias as (
        select *
        from {{ source('erp', 'agencias') }}
    )

    , renomeado as (
        select
            cast(cod_agencia as int) as pk_agencia
            , cast(nome as varchar) as nome_agencia
            , cast(endereco as varchar) as endereco_agencia
            , cast(cidade as varchar) as cidade_agencia
            , cast(uf as varchar) as uf_agencia
            , cast(data_abertura as date) as data_de_abertura
            , cast(tipo_agencia as varchar) as tipo_agencia
        from fonte_agencias
    )

select *
from renomeado
