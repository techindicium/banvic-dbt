with
    agencias as (
        select *
        from {{ ref('int_dimensao_agencias') }}
    )
select *
from agencias