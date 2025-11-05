*** Settings ***
Resource    ../resources/common_keywords.robot
Resource    ../pages/teacher_list_page.robot

*** Test Cases ***
Check Teacher List
    [Teardown]    Close Browser Session
    Open GHSS Website
    Open Teacher List

