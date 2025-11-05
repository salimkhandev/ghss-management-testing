*** Settings ***
Resource    ../resources/common_keywords.robot
Resource    ../pages/login_page.robot
Resource    ../pages/dashboard_page.robot

*** Test Cases ***
Admin Can Logout
    [Teardown]    Close Browser Session
    Open GHSS Website
    Login As Admin
    Logout

