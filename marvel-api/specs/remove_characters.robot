*** Settings ***
Documentation       Suite de Teste de exclusão de personagens na API da Marvel

Resource            ${EXECDIR}/resources/base.robot
Library             ${EXECDIR}/resources/factories/xmen.py

# Cria o gancho de execução dos testes
Suite Setup         Super Setup     ${email}

*** Test Cases ***
Deve remover um personagem pelo ID
    ${personagem}       Factory Ciclope
    ${ciclope}          POST New Character              ${personagem}
    ${ciclope_id}       Set Variable Character          ${ciclope.json()}[_id]
    # Deleta o personagem pelo ID
    ${response}         DELETE Character by ID          ${ciclope_id}
    # Valida o status da requisição
    Should Should Be    204                             ${response}
    ${response_two}     GET Character by ID             ${ciclope_id}
    Should Should Be    404                             ${response_two}

    # Valida o retorno da requisição
    Should Should Be    ${ciclope.json()}[name]         ${personagem}[name]
    Should Should Be    ${ciclope.json()}[aliases]      ${personagem}[aliases]
    Should Should Be    ${ciclope.json()}[age]          ${personagem}[age]
    Should Should Be    ${ciclope.json()}[team]         ${personagem}[team]
    Should Should Be    ${ciclope.json()}[active]       ${personagem}[active]

Não deve encontrar o usuário pelo ID inexistente
    # Deleta o personagem pelo ID, mas com um ID inválido (gerado aleatoriamente)
    ${personagem_id}    Get Unique ID
    ${response}         DELETE Character by ID          ${personagem_id}
    Should Should Be    404                             ${response}
    