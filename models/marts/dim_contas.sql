with
    dim_contas as (
        select *
        from {{ ref('int_dimensao_contas') }}
    )

select *
from dim_contas