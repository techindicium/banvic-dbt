with
    dim_agencias as (
        select *
        from {{ ref('stg_erp__agencias') }}
    )

select *
from dim_agencias
