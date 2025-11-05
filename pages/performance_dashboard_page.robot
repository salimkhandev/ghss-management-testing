*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource   base_page.robot

*** Variables ***
${TOP_RANKED_BUTTON}                xpath://button[contains(text(), 'Top 10 Ranked Students')]
${PAGE_LOAD_INDICATOR}              Select an option above to view performance data
${RANKED_STUDENTS_INDICATOR}        Rank #1

*** Keywords ***
Navigate To Performance Dashboard
    Go To    ${URL}/PerformanceDashboard
    Wait For Page To Load    ${PAGE_LOAD_INDICATOR}

View Top Ranked Students
    Navigate To Performance Dashboard
    Click Element With Wait    ${TOP_RANKED_BUTTON}
    Wait For Page To Load    ${RANKED_STUDENTS_INDICATOR}    timeout=30s

