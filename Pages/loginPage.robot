*** Settings ***
Documentation    Login Page 
Library    SeleniumLibrary


*** Variables ***
${username-loc}    xpath=(//input[@placeholder='Username'] | //input[@placeholder='Nombre de usuario'])
${password-loc}    xpath=(//input[@placeholder='Password'] | //input[@placeholder='Contraseña'])
${click-button}    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']


*** Keywords ***
Login with correct username and password
    [arguments]    ${username-data}    ${password-data}
    Wait Until Element Is Visible    ${username-loc}
    Input Text    ${username-loc}    ${username-data}
    Input Text    ${password-loc}    ${password-data}
    Click Element    ${click-button}