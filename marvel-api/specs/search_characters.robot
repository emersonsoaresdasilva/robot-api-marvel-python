*** Settings ***
Documentation       Suite de Teste de busca de personagens na API da Marvel

Resource            ${EXECDIR}/resources/base.robot
Library             ${EXECDIR}/resources/factories/xmen.py

# Cria o gancho de execução dos testes
Suite Setup         Super Setup     ${email}

*** Test Cases ***
Deve buscar um personagem pelo ID
    ${personagem}       Factory Logan
    ${logan}            POST New Character              ${personagem}
    ${logan_id}         Set Variable Character          ${logan.json()}[_id]
    # Busca o personagem pelo ID
    ${response}         GET Character by ID             ${logan_id}
    # Valida o status da requisição
    Should Should Be    200                             ${response}
    # Valida o retorno da requisição
    Should Should Be    ${logan.json()}[name]           ${personagem}[name]
    Should Should Be    ${logan.json()}[aliases]        ${personagem}[aliases]
    Should Should Be    ${logan.json()}[age]            ${personagem}[age]
    Should Should Be    ${logan.json()}[team]           ${personagem}[team]
    Should Should Be    ${logan.json()}[active]         ${personagem}[active]

Não deve retornar o personagem pelo ID
    # Busca o personagem pelo ID, mas com um ID inválido (gerado aleatoriamente)
    ${personagem_id}    Get Unique ID
    ${response}         GET Character by ID             ${personagem_id}
    Should Should Be    404                             ${response}
    