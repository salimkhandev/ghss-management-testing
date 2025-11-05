*** Settings ***
Resource    ../resources/common_keywords.robot
Resource    ../pages/performance_dashboard_page.robot

*** Test Cases ***
View Top Ranked Students
    [Teardown]    Close Browser Session
    Open GHSS Website
    View Top Ranked Students

