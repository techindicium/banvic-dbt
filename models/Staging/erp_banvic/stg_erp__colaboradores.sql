with
    fonte_colaboradores as (
        
        SELECT * FROM {{ source('erp', 'colaboradores') }}

    )


  ,renomeado as (

        select
            cast(cod_colaborador as int)                    as pk_colaborador 
            ,cast(cod_localidade as int)                    as fk_localidade
            ,cast(cod_gerente as int)                       as fk_gerente
            ,primeiro_nome || ' '|| ultimo_nome             as  nome_colaborador
            ,email                                          as email_colaborador
            ,endereco                                       as endereco_colaborador
            ,REGEXP_REPLACE(cpf, '[^a-zA-Z0-9]', '')        as cpf_colaborador
            ,cast(data_nascimento as date)                  as data_nascimento_colaborador
            ,REGEXP_REPLACE(cep, '[^a-zA-Z0-9]', '')        as cep_colaborador

            


        FROM fonte_colaboradores

)

SELECT * FROM renomeado