with
    dim_clientes as (
        select *
        from {{ ref('int_dimensao_clientes') }}
    )

select *
from dim_clientes
