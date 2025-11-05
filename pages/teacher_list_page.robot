*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource   base_page.robot

*** Variables ***
${PAGE_LOAD_INDICATOR}    Class 6

*** Keywords ***
Navigate To Teacher List
    Go To    ${URL}/TeachersList
    Wait For Page To Load    ${PAGE_LOAD_INDICATOR}    timeout=30s

Open Teacher List
    [Documentation]    Alias for Navigate To Teacher List. Kept for backward compatibility.
    Navigate To Teacher List

