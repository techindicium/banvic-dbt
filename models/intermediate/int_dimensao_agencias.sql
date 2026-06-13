with
    agencias as (
        select *
        from {{ ref('stg_erp__agencias') }}
    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidade') }}
    )

    , agencias_enriquecidas as (
        select
            agencias.pk_agencia
            , nome_agencia
            , data_abertura_agencia
            , endereco_agencia
            , tipo_agencia
            , localidades.cidade as cidade_agencia
            , localidades.uf as uf_agencia
        from agencias
        left join localidades on agencias.fk_localidade = localidades.pk_localidade
    )
select *
from agencias_enriquecidas