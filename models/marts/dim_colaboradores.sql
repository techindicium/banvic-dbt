with
    dim_colaboradores as (
        select *
        from {{ ref('stg_erp__colaboradores') }}
    )

select *
from dim_colaboradores