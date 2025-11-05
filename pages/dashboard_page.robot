*** Settings ***
Library    SeleniumLibrary
Resource   base_page.robot

*** Variables ***
${LOGOUT_BUTTON}         xpath://button[contains(text(), 'Logout')]
${YES_LOGOUT_BUTTON}     xpath://button[contains(text(), 'Yes, Logout')]
${HOME_PAGE_INDICATOR}   GHSS Luqman Banda

*** Keywords ***
Verify Dashboard Loaded
    Wait For Page To Load    ${HOME_PAGE_INDICATOR}

Logout
    Open Hamburger Menu
    Click Element With Wait    ${LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${YES_LOGOUT_BUTTON}    timeout=10s
    Click Element With Wait    ${YES_LOGOUT_BUTTON}
    Wait For Page To Load    ${HOME_PAGE_INDICATOR}

