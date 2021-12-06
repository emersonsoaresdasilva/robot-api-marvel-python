*** Settings ***
Documentation           Aqui é tudo que é necessário para o funcionamento do sistema

Library                 RequestsLibrary
Library                 helpers.py
Resource                routes/characters.robot

*** Variables ***
${api}              http://marvel.qaninja.academy
${email}            emersonsoares2001@gmail.com

*** Keywords ***
Super Setup
    [Arguments]         ${email}

    Set Client Key      ${email}
    Back To The Past

Set Client Key
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

Back To The Past
    # Volta ao passado, onde não há nada
    DELETE              ${api}/delorean         headers=${headers}