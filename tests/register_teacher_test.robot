*** Settings ***
Resource    ../resources/common_keywords.robot
Resource    ../pages/login_page.robot
Resource    ../pages/register_teacher_page.robot

*** Test Cases ***
Register Teacher Successfully
    [Teardown]    Close Browser Session
    Open GHSS Website
    Login As Admin
    Register New Teacher

