*** Settings ***
Library  Selenium2Library
Library  String
Resource   ./PO/Constants.robot

*** Variables ***
${LOGOFF_XPATH} =  xpath=//*[contains(@id,'LoginStatus')]


*** Keywords ***
Open Login Page
    Go To  ${WATER_LOGIN_PAGE}

Confirm Page Open
    Wait Until Page Contains  Customer & Utility Services Log In

Input Login name
    Set Log Level  NONE
    Input Text  id=MainContent_Login1_UserName  ${WATER_LOGIN_USER}
    Set Log Level  DEBUG

Input Login Credential
    Set Log Level  NONE

    Input Password  id=MainContent_Login1_Password   ${WATER_LOGIN_PSWD}
    Set Log Level  DEBUG

Submit Form
    Click Button  css=#ctl01 > div.container.body-content > div > div:nth-child(4) > div > input

Confirm Login Success
    Wait Until Element Contains  ${LOGOFF_XPATH}  Log off

Read Latest Usage
    ${latest read}=  Get Text  id=MainContent_lblLatestRead
    [Return]  ${latest read}

Read Date
    ${date}  Get Text  css=#MainContent_lblReadDateTime > table > tbody > tr:nth-child(1) > td:nth-child(1)
    [Return]  ${date}

Log Out
    Click Link  ${LOGOFF_XPATH}