with
    dim_clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    )

select *
from dim_clientes
