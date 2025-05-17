with
    fonte_colaboradores as (
        select *
        from {{ source('erp', 'colaboradores') }}
    )
    
    , renomeado_transformacao as (
        select
            cast(cod_colaborador as int) as pk_colaborador
            , primeiro_nome || ' ' || ultimo_nome as nome_colaborador
            , email as email_colaborador
            , regexp_replace(cpf, '[^a-zA-Z0-9]', '') as cpf_colaborador
            , cast(data_nascimento as date) as data_nascimento_colaborador
            , endereco as endereco_colaborador
            , cep as cep_colaborador
            , coalesce(
                regexp_substr(endereco, '\\b[A-Z]{2}\\b'), 'Não Encontrado'
            ) as uf_colaborador
        from fonte_colaboradores
    )

select *
from renomeado_transformacao