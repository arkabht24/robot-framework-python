*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary

*** Test Cases ***
Validate Unsuccessful Login
    open the browser with the app url
    fill in the login form
    wait until it checks and displays error message
    verify error message is correct

*** Keywords ***
open the browser with the app url
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    Maximize Browser Window
    # Go To    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
fill in the login form
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']
    Input Text    xpath=//input[@placeholder='Username']    Admin
    Wait Until Element Is Visible    xpath=//input[@placeholder='Password']
    Input Text    xpath=//input[@placeholder='Password']    admin
    Click Button    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
wait until it checks and displays error message
    Wait Until Element Is Visible    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']
verify error message is correct
    # Page Should Contain    Invalid credentials    
    ${error-message}=    Get Text    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']
    Should Be Equal As Strings    ${error-message}    Invalid credentials
     