with
    fonte_transacoes as (
        select *
        from {{ source('erp', 'transacoes') }}
    )
    
    , renomeado as (
        select
            cast(cod_transacao as int) as pk_transacao
            , cast(num_conta as int) as fk_conta
            , cast(cod_transacao as int) as numero_transacao
            , cast(data_transacao as date) data_transacao
            , cast(data_transacao as timestamp) ts_transacao
            , nome_transacao
            , case 
                when valor_transacao > 0 then 'Crédito'
                when valor_transacao < 0 then 'Débito'
                else null 
            end as tipo_transacao
            , cast(valor_transacao as numeric(28,2)) as valor_transacao
        from fonte_transacoes
    )

select *
from renomeado