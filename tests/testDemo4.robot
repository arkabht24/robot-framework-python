*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Setup    open the browser with the app url
Test Teardown    Close Browser session
Resource    resource.robot

*** Test Cases ***
Validate Unsuccessful Login
    fill in the login form    ${username-data}    ${invalid-password-data} 
    wait until it checks and displays error message
    verify error message is correct

Validate Successful Login and more
    fill in the login form    ${username-data}    ${valid-password-data}
    verify all the contents of the quick launch is displayed



*** Keywords ***
fill in the login form
    [arguments]    ${user-name-data-arg}    ${password-data-arg}
    Wait Until Element Is Visible    ${input-username}
    Input Text    ${input-username}    ${user-name-data-arg}
    Wait Until Element Is Visible    ${input-password}
    Input Text    ${input-password}    ${password-data-arg}
    Click Button    ${click-button}
wait until it checks and displays error message
    Wait Until Element Is Visible    ${error-message-p-box}
verify error message is correct
    Element Text Should Be    ${error-message-p-box}    ${expected-error-message-data}
verify all the contents of the quick launch is displayed  
    @{list-of-quick-launch}=    Create List    Assign Leave    Leave List    Timesheets    Apply Leaves    My Leave    My Timesheets
    Wait Until Element Is Visible    ${quick-actions}
    ${list-of-quick-launch-UI}=    Get WebElements    ${quick-actions}
    FOR    ${element}    IN    ${quick-actions}
        ${element-text}=    Get Text    ${element}
        Log    Element text is ${element-text}
        Should Contain    ${list-of-quick-launch}    ${element-text}
    END