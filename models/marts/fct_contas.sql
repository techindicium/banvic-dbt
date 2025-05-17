with
    fct_contas as (
        select *
        from {{ ref('int_fato_contas') }}
    )

select *
from fct_contas