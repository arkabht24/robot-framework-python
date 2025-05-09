*** Settings ***
Documentation    Login Test with Parameterised inputs
Library    SeleniumLibrary
Library    DataDriver    file=data.csv    encoding=utf-8    dialect=unix
Test Setup    open the browser with the app url
Test Teardown    Close Browser session
Resource    resource.robot    
Test Template    Validate Unsuccessful Login in Orange HRM


*** Test Cases ***
Login with username and password    ${username}    ${password}

*** Keywords ***
Validate Unsuccessful Login in Orange HRM
    [Arguments]    ${username}    ${input-password}
    Fill login form with invalid credentials    ${username}      ${input-password}

Fill login form with invalid credentials
    [Arguments]    ${username-invalid}    ${password-invalid}
    Input Text    ${input-username}    ${username-invalid}
    Input Text    ${input-password}    ${password-invalid}
    Click Element    ${click-button}
