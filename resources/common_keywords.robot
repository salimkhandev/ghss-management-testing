*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot

*** Keywords ***
Open GHSS Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Browser Session
    Close Browser

