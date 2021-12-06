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

GET Character By ID
    [Arguments]         ${character_id}

    # Envia requisição GET para a API da Marvel
    ${response}         GET
    ...                 ${api}/characters/${character_id}
    ...                 headers=${headers}
    # Valida o código de status da resposta depois...
    ...                 expected_status=any

    [return]            ${response}

DELETE Character By ID
    [Arguments]         ${character_id}

    # Envia requisição DELETE para a API da Marvel
    ${response}         DELETE
    ...                 ${api}/characters/${character_id}
    ...                 headers=${headers}
    # Valida o código de status da resposta depois...
    ...                 expected_status=any

    [return]            ${response}