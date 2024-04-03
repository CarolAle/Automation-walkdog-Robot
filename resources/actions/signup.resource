*** Settings ***
Documentation    Ações, steps e elementos da funcionalidade de cadastro

Library    SeleniumLibrary

*** Keywords ***
Go to signup page
    Click Element    css:a[href="/signup"]
    Wait Until Element Is Visible    tag:form 
    Get Text    tag:h1

Fill signup form
    [Arguments]      ${dog_walker}
    Input Text    css:input[name=name]             text=${dog_walker}[name]
    Input Text    css:input[name=email]            text=${dog_walker}[email]
    Input Text    css:input[name=cpf]              text=${dog_walker}[cpf]
    Input Text    css:input[name=cep]              text=${dog_walker}[cep]

    Click Element    css:input[type=button][value$=CEP]
    
    Wait Until Page Contains Element    css:input[value="${dog_walker}[addressStreet]"]     20
    Element Attribute Value Should Be   css:input[name=addressStreet]           value    ${dog_walker}[addressStreet]
    Element Attribute Value Should Be   css:input[name=addressDistrict]         value    ${dog_walker}[addressDistrict]
    Element Attribute Value Should Be   css:input[name=addressCityUf]           value    ${dog_walker}[addressCityUf]

    Input Text    css:input[name=addressNumber]    text=${dog_walker}[addressNumber]

    Choose File    css:input[type=file]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]

Additional Service
    [Arguments]    ${service}
    Click Element    xpath://span[text()="${service}"]/..

Submit signup form
    Click Element    css:.button-register

Popup should be
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    css:.swal2-html-container    5 
    Element Text Should Be    css:.swal2-html-container    ${expected_text}

Alert should be
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    //span[text()="${expected_text}"]