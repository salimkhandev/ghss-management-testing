*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource   base_page.robot

*** Variables ***
${REGISTER_BUTTON}            css:#root > main > form > button
${TEACHER_NAME_INPUT}         xpath://input[@name='name' or @placeholder='Name' or contains(@id, 'name')]
${TEACHER_PASSWORD_INPUT}     xpath://input[@type='password' or @name='password' or contains(@id, 'password')]
${TEACHER_CLASS_SELECT_ELEMENT}    xpath://select[@name='class' or contains(@id, 'class')]
${TEACHER_CLASS_MUI_SELECT}        xpath://div[contains(@class, 'MuiSelect-root')]
${TEACHER_SECTION_INPUT}      xpath://input[@name='section' or @placeholder='Section' or contains(@id, 'section')]
${PAGE_TITLE_TEXT}            Register Teacher
${SUCCESS_MESSAGE_TEXT}        Teacher registered successfully

*** Keywords ***
Navigate To Teacher Registration
    Go To    ${URL}/TeacherRegistration
    Wait For Page To Load    ${PAGE_TITLE_TEXT}    timeout=30s

Fill Teacher Registration Form
    [Arguments]    ${name}=${TEACHER_NAME}    ${password}=${TEACHER_PASSWORD}    ${class}=${TEACHER_CLASS}    ${section}=${TEACHER_SECTION}
    Wait Until Element Is Visible    ${TEACHER_NAME_INPUT}    timeout=10s
    Input Text    ${TEACHER_NAME_INPUT}    ${name}
    Input Text    ${TEACHER_PASSWORD_INPUT}    ${password}
    # Handle class selection - try standard select first, then Material-UI select, then input
    ${select_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${TEACHER_CLASS_SELECT_ELEMENT}    timeout=2s
    Run Keyword If    ${select_visible}    Select From List By Label    ${TEACHER_CLASS_SELECT_ELEMENT}    ${class}
    ...    ELSE    Select Class From MaterialUI    ${class}
    Input Text    ${TEACHER_SECTION_INPUT}    ${section}

Select Class From MaterialUI
    [Arguments]    ${class_value}
    # Try to find Material-UI select - look near Class label
    ${mui_select_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://label[contains(text(), 'Class')]/following-sibling::div[contains(@class, 'MuiSelect-root')]    timeout=3s
    Run Keyword If    ${mui_select_visible}    Click Element    xpath://label[contains(text(), 'Class')]/following-sibling::div[contains(@class, 'MuiSelect-root')]
    ...    ELSE    Click Element    ${TEACHER_CLASS_MUI_SELECT}
    Sleep    0.5s
    # Click on the option in the dropdown - try li first, then div with role='option'
    ${li_option_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://li[contains(text(), '${class_value}')]    timeout=2s
    Run Keyword If    ${li_option_visible}    Click Element    xpath://li[contains(text(), '${class_value}')]
    ...    ELSE    Click Element    xpath://div[@role='option' and contains(text(), '${class_value}')]

Submit Teacher Registration
    Wait Until Element Is Visible    ${REGISTER_BUTTON}    timeout=10s
    Click Element With Wait    ${REGISTER_BUTTON}
    Wait For Page To Load    ${SUCCESS_MESSAGE_TEXT}    timeout=10s

Register New Teacher
    [Documentation]    Registers a new teacher. Form fields are prefilled, so only navigation and submission are needed.
    Navigate To Teacher Registration
    Submit Teacher Registration

