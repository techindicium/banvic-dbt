with
    dim_datas as (
        select *
        from {{ ref('int_dimensao_datas') }}
    )

select *
from dim_datas
