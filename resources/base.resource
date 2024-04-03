*** Settings ***
Documentation    Arquivo principal do projeto

Library    SeleniumLibrary

Resource    actions/signup.resource

*** Keywords ***
Start session
    Open Browser    url=https://walkdog.vercel.app    service_log_path=None
    Page Should Contain Element    tag:h1    Cuidado e diversão em cada passo    5

Finish session
    Close Browser