with
    clientes as (
        select *
        from {{ ref('int_dimensao_clientes') }}
    )
select *
from clientes