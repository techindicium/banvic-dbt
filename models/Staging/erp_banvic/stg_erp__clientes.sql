with
    fonte_clientes as (
        
        SELECT * FROM {{ source('erp', 'clientes') }}

    )


  ,renomeado as (

        select
            cast(cod_cliente as int) as pk_cliente
            ,cast(cod_localidade as int) as fk_cliente
            ,primeiro_nome || ' '|| ultimo_nome as  nome_cliente
            ,email as email_cliente
            ,tipo_cliente
            ,CAST(data_inclusao as timestamp) as ts_inclusao
            ,REGEXP_REPLACE(cpfcnpj, '[^a-zA-Z0-9]', '') as cpf_cnpj_cliente
            ,cast(data_nascimento as date) as data_nascimento_cliente
            ,endereco as endereco_cliente
            ,REGEXP_REPLACE(cep, '[^a-zA-Z0-9]', '') as cep_cliente
            ,CAST(cod_localidade as int) as fk_localidade
            


        FROM fonte_clientes

)

SELECT * FROM renomeado