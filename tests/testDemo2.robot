*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
Validate Unsuccessful Login
    open the browser with the app url
    fill in the login form
    wait until it checks and displays error message
    verify error message is correct

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${input-username}    xpath=//input[@placeholder='Username']
${input-password}    xpath=//input[@placeholder='Password']
${click-button}    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
${error-message-p-box}    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']



*** Keywords ***
open the browser with the app url
    Open browser    ${url}  chrome
    Maximize Browser Window
fill in the login form
    Wait Until Element Is Visible    ${input-username}
    Input Text    ${input-username}    Admin
    Wait Until Element Is Visible    ${input-password}
    Input Text    ${input-password}    admin
    Click Button    ${click-button}
wait until it checks and displays error message
    Wait Until Element Is Visible    ${error-message-p-box}
verify error message is correct
    # Page Should Contain    Invalid credentials    
    # ${error-message}=    Get Text    ${error-message-p-box}
    # Should Be Equal As Strings    ${error-message}    Invalid credentials
    Element Text Should Be    ${error-message-p-box}    Invalid credentials
     