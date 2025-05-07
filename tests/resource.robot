*** Settings ***
# Documentation    To validate the Login form resource
# ...    Here we are keeping the system specific Keywords
# ...    Let's explore
# Library    SeleniumLibrary

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${input-username}    xpath=//input[@placeholder='Username']
${input-password}    xpath=//input[@placeholder='Password']
${click-button}    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
${error-message-p-box}    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']

${username-data}    Admin
${valid-password-data}    admin123
${invalid-password-data}    admin
${expected-error-message-data}    Invalid credentials


*** Keywords ***
open the browser with the app url
    Open browser    ${url}  chrome
    Maximize Browser Window
Close Browser session
    Close Browser