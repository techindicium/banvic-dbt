with
    fonte_propostas_credito as (
        select *
        from {{ source('erp', 'propostas_credito') }}
    )
    
    , renomeado as (
        select
            cast(cod_proposta as int) as pk_proposta
            , cast(cod_cliente as int) as fk_cliente
            , cast(cod_colaborador as int) as fk_colaborador
            , cast(cod_proposta as int) as numero_proposta
            , cast(data_entrada_proposta as timestamp) as ts_entrada_proposta
            , cast(taxa_juros_mensal as numeric(12,5)) as taxa_juros_mensal 
            , cast(valor_proposta as numeric(28,2)) as valor_proposta 
            , cast(valor_financiamento as numeric(28,2)) as valor_financiamento
            , cast(valor_entrada as numeric(28,2)) as valor_entrada
            , cast(valor_prestacao as numeric(28,2)) as valor_prestacao
            , cast(quantidade_parcelas as int) as quantidade_parcelas
            , cast(carencia as int) as carencia
            , status_proposta
        from fonte_propostas_credito
    )

select *
from renomeado