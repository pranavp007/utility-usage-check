*** Settings ***
Library  Selenium2Library
Resource   ./PO/Constants.robot
Library  Selenium2Library

*** Variables ***
${TEXTBOX_USER} =  id=username
${TEXTBOX_PSWD} =  id=txtPassword

*** Keywords ***
Open Login Page
    Go To  ${POWER_LOGIN_PAGE}

Confirm Page Open
    Wait Until Page Contains  Current User Log In

Input Login name
    Set Log Level  NONE
    Input Text  ${TEXTBOX_USER}  ${POWER_LOGIN_USER}
    Set Log Level  DEBUG

Input Login Credential
    Set Log Level  NONE
    Input Password   ${TEXTBOX_PSWD}   ${POWER_LOGIN_PSWD}
    Set Log Level  DEBUG

Submit Form
    Click Button  id=LOGIn

Confirm Login Success
    Wait Until Element Contains  css=#banner_logout > table > tbody > tr > td > a  Log Out

Read Latest Usage
    ${latest read}=  Get Text  css=#td_print_end > table > tbody > tr:nth-child(3) > td > table > tbody > tr.odrRowEven > td:nth-child(4) > span
    [Return]  ${latest read}

Read Date
    ${date}  Get Text  css=#td_print_end > table > tbody > tr:nth-child(3) > td > table > tbody > tr.odrRowEven > td:nth-child(2) > span
    [Return]  ${date}

Log Out
    Click Link  css=#banner_logout > table > tbody > tr > td > a