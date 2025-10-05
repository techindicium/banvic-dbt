with
    colaboradores as (
        select *
        from {{ ref('stg_erp__colaboradores') }}
    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}
    )

    , colaboradores_enriquecido as (
        select 
            colaboradores.pk_colaborador
            , colaboradores.nome_colaborador
            , colaboradores.email_colaborador
            , colaboradores.cpf_colaborador
            , colaboradores.data_nascimento_colaborador
            , colaboradores.endereco_colaborador
            , colaboradores.cep_colaborador
            , localidades.cidade as cidade_colaborador
            , localidades.uf as uf_colaborador
        from colaboradores
        left join localidades
    )

select *
from colaboradores_enriquecido
