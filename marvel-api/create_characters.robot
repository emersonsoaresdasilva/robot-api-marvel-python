*** Settings ***
Documentation       Suite de Teste do cadastro de personagens na API da Marvel

Library             RequestsLibrary
Library             ${EXECDIR}/factories/thanos.py

*** Variables ***
${api}              http://marvel.qaninja.academy
${email}            emersonsoares2001@gmail.com

*** Test Cases ***
Teste de integração de cadastro de personagens na API da Marvel
    Account And Set Headers     ${email}

    # Cria o personagem da Marvel
    &{personagem}       Factory Thanos
   
    # Envia requisição POST para a API da Marvel
    ${response}         POST                
    ...                 ${api}/characters
    ...                 json=${personagem}
    ...                 headers=${headers}

    # Verifica se o personagem foi criado
    Status Should Be    200     ${response}

*** Keywords ***
Account And Set Headers
    [Arguments]         ${email}
    # Pede autorização à API
    &{usuario}          CreateDictionary
    ...                 email=${email}
    
    # Envia requisição POST solicitando o Token para acesso à API da Marvel
    ${response}         POST
    ...                 ${api}/accounts
    ...                 json=${usuario}
    
    # Pega e envia o Token de autorização, através da requisição
    ${client_key}       Set Variable            ${response.json()}[client_key]
    &{headers}          CreateDictionary        client_key=${client_key}

    Set Suite Variable  ${headers}