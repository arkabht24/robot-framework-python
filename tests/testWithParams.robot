*** Settings ***
Documentation    Login Test with Parameterised inputs
Library    SeleniumLibrary
Test Setup    open the browser with the app url
Test Teardown    Close Browser session
Resource    resource.robot    
Test Template    Validate Unsuccessful Login in Orange HRM


*** Test Cases ***
Invalid username    Admun    admin123
Invalid password    Admin    admin123
Special Character    -$%    admin123

*** Keywords ***
Validate Unsuccessful Login in Orange HRM
    [Arguments]    ${username}    ${input-password}
    Fill login form with invalid credentials    ${username}      ${input-password}

Fill login form with invalid credentials
    [Arguments]    ${username-invalid}    ${password-invalid}
    Input Text    ${input-username}    ${username-invalid}
    Input Text    ${input-password}    ${password-invalid}
    Click Element    ${click-button}
