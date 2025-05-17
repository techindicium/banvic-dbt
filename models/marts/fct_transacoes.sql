with
    fct_transacoes as (
        select *
        from {{ ref('int_fato_transacoes') }}
    )

select *
from fct_transacoes