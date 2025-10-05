with
    dim_colaboradores as (
        select *
        from {{ ref('int_dimensao_colaboradores') }}
    )

select *
from dim_colaboradores