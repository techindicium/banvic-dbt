with
    fonte_colaborador_agencia as (
        select *
        from {{ source('erp', 'colaborador_agencia') }}
    )
    
    , renomeado as (
        select
            cast(cod_colaborador as int) as fk_colaborador
            , cast(cod_agencia as int) as fk_agencia
        from fonte_colaborador_agencia
    )

select *
from renomeado