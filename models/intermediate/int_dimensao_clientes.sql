with
    clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    )

    , localidades as (
        select *
        from {{ ref('stg_erp__localidade') }}
    )

    , clientes_enriquecidos as (
        select
            clientes.pk_cliente
            , nome_cliente
            , email_cliente
            , tipo_cliente
            , ts_inclusao
            , cpf_cnpj_cliente
            , data_nascimento_cliente
            , endereco_cliente
            , cep_cliente
            , localidades.cidade as cidade_cliente
            , localidades.uf as uf_cliente
        from clientes
        left join localidades on clientes.fk_localidade = localidades.pk_localidade
    )
select *
from clientes_enriquecidos