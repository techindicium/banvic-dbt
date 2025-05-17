with
    stg_contas as (
        select 
            pk_conta
            , fk_cliente
            , fk_agencia
            , fk_colaborador
            , saldo_total
            , saldo_disponivel
            , ts_ultimo_lancamento
        from {{ ref('stg_erp__contas') }}
    )

select *
from stg_contas