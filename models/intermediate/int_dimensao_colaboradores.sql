with
    colaboradores as (
        select *
        from {{ ref('stg_erp__colaboradores') }}
    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidade') }}
    )

    , colaboradores_enriquecidos as (
        select
            colaboradores.pk_colaborador
            , nome_colaborador
            , email_colaborador
            , cpf_colaborador
            , data_nascimento_colaborador
            , endereco_colaborador
            , cep_colaborador
            , localidades.cidade as cidade_colaborador
            , localidades.uf as uf_colaborador
        from colaboradores
        left join localidades on colaboradores.fk_localidade = localidades.pk_localidade
    )
select *
from colaboradores_enriquecidos