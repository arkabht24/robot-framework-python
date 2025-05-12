*** Settings ***
Documentation    Login Page 
Library    SeleniumLibrary


*** Variables ***
${buzz-header}    xpath=(//div[@class='orangehrm-buzz-newsfeed']/p)


*** Keywords ***
Verify header in buzz page
    [arguments]    ${expected-text}
    Wait Until Element Is Visible    ${buzz-header}
    ${actual-text}    Get Text    ${buzz-header}
    log    expected ${expected-text} actual ${actual-text}
    Should Be Equal    ${actual-text}    ${expected-text}
    