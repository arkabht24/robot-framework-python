*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Setup    open the browser with the app url
Test Teardown    Close Browser session
Resource    resource.robot

*** Test Cases ***
Validate Unsuccessful Login
    fill in the login form
    wait until it checks and displays error message
    verify error message is correct

Validate 



*** Keywords ***
fill in the login form
    Wait Until Element Is Visible    ${input-username}
    Input Text    ${input-username}    ${username-data}
    Wait Until Element Is Visible    ${input-password}
    Input Text    ${input-password}    ${invalid-password-data}
    Click Button    ${click-button}
wait until it checks and displays error message
    Wait Until Element Is Visible    ${error-message-p-box}
verify error message is correct
    Element Text Should Be    ${error-message-p-box}    ${expected-error-message-data}
     