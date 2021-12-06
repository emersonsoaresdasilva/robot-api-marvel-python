*** Settings ***
Documentation       Suite de Teste do cadastro de personagens na API da Marvel

Resource            ${EXECDIR}/resources/base.robot
Library             ${EXECDIR}/resources/factories/guardians.py

# Cria o gancho de execução dos testes
Suite Setup         Super Setup     ${email}

*** Test Cases ***
Teste de integração de cadastro de personagens na API da Marvel
    # Cria o personagem da Marvel
    &{personagem}       Factory Thanos
   
    # Envia requisição POST para a API da Marvel
    ${response}         POST New Character      ${personagem}

    # Verifica se o personagem foi criado
    Status Should Be    200     ${response}

Não deve cadastrar personagem com o mesmo nome
    # Dado que o Thanos já existe
    &{personagem}           Factory Deadpool
    POST New Character      ${personagem}
    
    # Quando faço uma requisição POST para a API da Marvel
    ${response}     POST New Character      ${personagem}

    # Então o status da resposta deve ser 409
    Status Should Be    409     ${response}

    # Valida a resposta obtida com a esperada
    Should Be Equal     ${response.json()}[error]       Character already exists :(