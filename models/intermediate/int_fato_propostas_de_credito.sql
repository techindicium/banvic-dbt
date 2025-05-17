with
    propostas as (
        select
            pk_proposta
            , fk_cliente
            , fk_colaborador
            , numero_proposta
            , ts_entrada_proposta
            , taxa_juros_mensal 
            , valor_proposta 
            , valor_financiamento
            , valor_entrada
            , valor_prestacao
            , quantidade_parcelas
            , carencia
            , status_proposta
        from {{ ref('stg_erp__propostas_de_credito') }}
    )

    , agencia_colaborador as (
        select
            fk_colaborador
            , fk_agencia
        from {{ ref('stg_erp__agencia_colaboradores') }}
    )

    , joined as (
        select
            propostas.pk_proposta
            , propostas.fk_cliente
            , propostas.fk_colaborador
            , agencia_colaborador.fk_agencia
            , propostas.numero_proposta
            , propostas.ts_entrada_proposta
            , propostas.taxa_juros_mensal 
            , propostas.valor_proposta 
            , propostas.valor_financiamento
            , propostas.valor_entrada
            , propostas.valor_prestacao
            , propostas.quantidade_parcelas
            , propostas.carencia
            , propostas.status_proposta
        from propostas
        left join agencia_colaborador on propostas.fk_colaborador = agencia_colaborador.fk_colaborador
    )

select *
from joined