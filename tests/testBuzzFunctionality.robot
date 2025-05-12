*** Settings ***
Documentation    Check the navigation of Buzz Page in Orange HRM
Library    SeleniumLibrary
Test Setup    open browser and navigate to app url
Test Teardown    close broser session
Resource    ../Pages/loginPage.robot
Resource    ../Pages/landingPage.robot
Resource    ../Pages/buzzPage.robot


*** Variables ***
${username-data}    Admin
${password-data}    admin123
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${buzz-element}    xpath=(//li/a/span[(text()='Buzz')])
${expected-text-header}    Buzz Newsfeed


*** Test Cases ***
Validate the header of the Buzz Page
    Login with correct username and password     ${username-data}     ${password-data}
    Verify element is visible in UI    ${buzz-element}
    Click on the Buzz button
    Verify header in buzz page    ${expected-text-header}


*** Keywords ***
open browser and navigate to app url
    Open Browser    ${url}    chrome
close broser session
    Close Browser
Verify element is visible in UI
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Element Should Be Visible    ${element}


