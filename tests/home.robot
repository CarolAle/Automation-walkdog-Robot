*** Settings ***
Documentation        Suite de testes da home


Library              SeleniumLibrary

*** Test Cases ***
Home page deve estar online
    Open Browser              url=https://walkdog.vercel.app/   
    Element Text Should Be    tag:h1    Cuidado e diversão em cada passo