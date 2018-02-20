*** Settings ***
Library  OperatingSystem
Library  String
Library  Collections
Resource   ./Constants.robot

*** Variables ***


*** Keywords ***

Write to File and Return Daily usage
    [Arguments]  ${file_name}  ${date}   ${latest_read}  ${precision}
    ${last_reading} =  Get Last Reading  ${file_name}
    ${last_reading} =  Convert To Number  ${last_reading}   precision=${precision}
    ${latest_read} =  Convert To Number  ${latest_read}     precision=${precision}
    Log  Latest is ${latest_read}, Last is ${last_reading}
    ${daily_usage} =  Evaluate    ${latest_read} - ${last_reading}
    Log  Today's usage is : ${daily_usage}
    Write to File   ${file_name}    ${date}     ${latest_read}      ${daily_usage}
    [Return]    ${daily_usage}

Get Last Reading
    [Arguments]  ${file_name}
    # Get the last line from file
    ${last_line} =  Get Last Line from File  ${file_name}

    # Get the reading from last line
    ${last_reading} =  Get Field from Line  ${last_line}    ${POSITION_READING}

    [Return]  ${last_reading}


Get Last Line from File
    [Arguments]  ${file_name}
    ${file_content} =  Get File  ${file_name}
    Log  ${file_content}
    @{lines} =  Split to Lines   ${file_content}
    ${total_lines} =  Get Length  ${lines}
    Log  ${total_lines}
    ${last_position} =  Evaluate  ${total_lines} - 1
    [Return]  @{lines}[${last_position}]


Get Field from Line
    [Arguments]     ${line}    ${position}
    @{all_fields} =  Split String  ${line}  ${FILE_DELIMITER}
    ${position} =  Evaluate   ${position} - 1
    [Return]  @{all_fields}[${position}]


Write to File
    [Arguments]  ${file_name}    ${date}     ${latest_read}      ${daily_usage}
    ${new_line} =  Set Variable  ${date}${FILE_DELIMITER}${latest_read}${FILE_DELIMITER}${daily_usage}${\n}
    Append to File    ${file_name}  ${new_line}


