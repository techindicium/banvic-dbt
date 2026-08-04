with colaboradores as (

    select *
    from {{ ref('stg_erp__colaboradores') }}

)

, localidades as (
    SELECT * 
    FROM {{ ref('stg_erp__localidades') }}
)

, colaboradores_enriquecido as(
     select 
         colaboradores.pk_colaborador
         , colaboradores.nome_colaborador
         , colaboradores.email_colaborador
         , colaboradores.endereco_colaborador
         , colaboradores.cpf_colaborador
         , colaboradores.data_nascimento_colaborador
         , colaboradores.cep_colaborador
         , localidades.cidade            as cidade_colaborador
         , localidades.UF                as uf_colaborador
     from colaboradores
     left join localidades on colaboradores.fk_localidade = localidades.pk_localidade

)

select * from colaboradores_enriquecido