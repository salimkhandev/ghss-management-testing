*** Settings ***
Resource    ../resources/common_keywords.robot
Resource    ../pages/login_page.robot

*** Test Cases ***
Admin Can Login
    [Teardown]    Close Browser Session
    Open GHSS Website
    Login As Admin

