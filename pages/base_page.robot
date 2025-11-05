*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Variables ***
# Shared UI Elements
${HAMBURGER_MENU}        css:button.MuiButtonBase-root.MuiIconButton-root.MuiIconButton-sizeMedium.css-11ls7ns

*** Keywords ***
Wait For Page To Load
    [Arguments]    ${expected_text}    ${timeout}=10s
    Wait Until Page Contains    ${expected_text}    timeout=${timeout}

Click Element With Wait
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}
    Click Element    ${locator}

Open Hamburger Menu
    Click Element With Wait    ${HAMBURGER_MENU}
    ${login_exists}=    Run Keyword And Return Status    Wait Until Page Contains    Login    timeout=5s
    ${logout_exists}=    Run Keyword And Return Status    Wait Until Page Contains    Logout    timeout=5s
    Should Be True    ${login_exists} or ${logout_exists}    Menu should contain either Login or Logout button

