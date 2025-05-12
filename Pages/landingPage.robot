*** Settings ***
Documentation    Login Page 
Library    SeleniumLibrary



*** Variables ***
${Buzz}    xpath=//li/a/span[(text()='Buzz')]

*** Keywords ***
Click on the Buzz button
    Click Element    ${Buzz}
    Sleep    3s