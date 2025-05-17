with
    fct_propostas_de_credito as (
        select *
        from {{ ref('int_fato_propostas_de_credito') }}
    )

select *
from fct_propostas_de_credito