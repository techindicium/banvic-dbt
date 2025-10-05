with
    dim_agencias as (
        select *
        from {{ ref('int_dimensao_agencias') }}
    )

select *
from dim_agencias
