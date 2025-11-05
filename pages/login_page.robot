*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource   base_page.robot

*** Variables ***
${MENU_LOGIN_BUTTON}           xpath://button[text()='Login' and contains(@class, 'css-ri3apr')]
${ADMIN_BUTTON_IN_MODAL}       css:body > div.MuiDialog-root.MuiModal-root.css-1ylb0ds > div.MuiDialog-container.MuiDialog-scrollPaper.css-ekeie0 > div > div.MuiBox-root.css-11mc445 > button.MuiButtonBase-root.MuiButton-root.MuiButton-text.MuiButton-textPrimary.MuiButton-sizeMedium.MuiButton-textSizeMedium.MuiButton-colorPrimary.css-1j2wxgt
${SUBMIT_LOGIN_BUTTON}         xpath://button[@type='submit' and text()='Login' and contains(@class, 'css-1uyleoe')]
${SELECT_ROLE_TEXT}            Select Role
${ADMIN_LOGIN_TEXT}            Admin Login
${LOGIN_SUCCESS_TEXT}          Login successful!

*** Keywords ***
Login As Admin
    Open Hamburger Menu
    Wait For Page To Load    Login
    Click Element With Wait    ${MENU_LOGIN_BUTTON}
    Wait For Page To Load    ${SELECT_ROLE_TEXT}
    Click Element With Wait    ${ADMIN_BUTTON_IN_MODAL}
    Wait For Page To Load    ${ADMIN_LOGIN_TEXT}
    Click Element With Wait    ${SUBMIT_LOGIN_BUTTON}
    Wait For Page To Load    ${LOGIN_SUCCESS_TEXT}

