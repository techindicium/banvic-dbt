with
    agencias as (
        select *
        from {{ ref('stg_erp__agencias') }}
    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}
    )

    , agencias_enriquecido as (
        select 
            agencias.pk_agencia
            , agencias.nome_agencia 
            , agencias.endereco_agencia 
            , agencias.data_de_abertura 
            , agencias.tipo_agencia
            , localidades.cidade as cidade_agencia
            , localidades.uf as uf_agencia
        from agencias
        left join localidades on agencias.fk_localidade = localidades.pk_localidade
    )

select *
from agencias_enriquecido


