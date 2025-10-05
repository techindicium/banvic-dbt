with
    fonte_clientes as (
        select *
        from {{ source('erp', 'clientes') }}
    )
    
    , renomeado_transformacao as (
        select
            cast(cod_cliente as int) as pk_cliente
            , cast(cod_localidade as int) as fk_localidade
            , primeiro_nome || ' ' || ultimo_nome as nome_cliente
            , email as email_cliente
            , tipo_cliente
            , regexp_replace(cpfcnpj, '[^a-zA-Z0-9]', '') as cpfcnpj_cliente
            , cast(data_inclusao as timestamp) as ts_inclusao
            , cast(data_nascimento as date) as data_nascimento_cliente
            , endereco as endereco_cliente
            , cep as cep_cliente
        from fonte_clientes
    )

select *
from renomeado_transformacao