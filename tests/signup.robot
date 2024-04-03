*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup        Start session
Test Teardown     Finish session


*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]        smoke
#super variável
    ${dog_walker}    Create Dictionary
    ...    name=Carolina Alessandra    
    ...    email=carolinalessandra2@gmail.com
    ...    cpf=00000014141
    ...    cep=59063100
    ...    addressNumber=86
    ...    addressStreet=Avenida Jerônimo Câmara
    ...    addressDistrict=Lagoa Nova
    ...    addressCityUf=Natal/RN
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.

Deve poder cadastrar um novo dog walker que sabe cuidar de pets
    ${dog_walker}    Create Dictionary
    ...    name=Usuário 2   
    ...    email=user02@gmail.com
    ...    cpf=00000014141
    ...    cep=59063100
    ...    addressNumber=86
    ...    addressStreet=Avenida Jerônimo Câmara
    ...    addressDistrict=Lagoa Nova
    ...    addressCityUf=Natal/RN
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Additional Service    Cuidar
    Submit signup form
    Popup should be    Recebemos o seu cadastro e em breve retornaremos o contato.


Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]        required

    Go to signup page
    Submit signup form
    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Adcione um documento com foto (RG ou CHN)

Não deve cadastrar se o cpf for incorreto
    [Tags]        cpf_inv

    ${dog_walker}    Create Dictionary
    ...    name=Usuário 3    
    ...    email=user03@gmail.com
    ...    cpf=000000141aa
    ...    cep=59063100
    ...    addressNumber=86
    ...    addressStreet=Avenida Jerônimo Câmara
    ...    addressDistrict=Lagoa Nova
    ...    addressCityUf=Natal/RN
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido