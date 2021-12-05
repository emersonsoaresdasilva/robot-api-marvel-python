*** Settings ***
Documentation           Ações da rota /characters

*** Keywords ***
POST New Character
    [Arguments]         ${payload}

    # Envia requisição POST para a API da Marvel
    ${response}         POST                
    ...                 ${api}/characters
    ...                 json=${payload}
    ...                 headers=${headers}
    # Valida o código de status da resposta depois...
    ...                 expected_status=any

    [return]            ${response}