with
    fonte_agencias as (
        select *
        from {{ source('erp', 'agencias') }}
    )

, renomeado as (
        select
            cast (cod_agencia as int) as pk_agencia
                , cast (cod_localidade as int) as fk_localidade
                , nome as nome_agencia
                , cast (data_abertura as date) as data_abertura_agencia
                , endereco as endereco_agencia
                , tipo_agencia
        from fonte_agencias    
)
select *
from renomeado