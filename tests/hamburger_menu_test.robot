*** Settings ***
Resource    ../resources/common_keywords.robot
Resource    ../pages/dashboard_page.robot

*** Test Cases ***
Hamburger Menu Opens
    [Teardown]    Close Browser Session
    Open GHSS Website
    Open Hamburger Menu

