with
    fonte_clientes as (
        select *
        from {{ source('erp', 'clientes') }}
    )
    
    , renomeado_transformacao as (
        select
            cast(cod_cliente as int) as pk_cliente
            , primeiro_nome || ' ' || ultimo_nome as nome_cliente
            , email as email_cliente
            , tipo_cliente
            , regexp_replace(cpfcnpj, '[^a-zA-Z0-9]', '') as cpfcnpj_cliente
            , cast(data_inclusao as timestamp) as ts_inclusao
            , cast(data_nascimento as date) as data_nascimento_cliente
            , endereco as endereco_cliente
            , cep as cep_cliente
            , coalesce(
                regexp_substr(endereco, '\\b[A-Z]{2}\\b'), 'Não Encontrado'
            ) as uf_cliente
        from fonte_clientes
    )

select *
from renomeado_transformacao