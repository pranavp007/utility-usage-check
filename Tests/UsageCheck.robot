*** Settings ***

Documentation  Check daily usage for the utilities
Resource  ../Resources/Commons.robot
Resource  ../Resources/WaterUtilities.robot
Resource  ../Resources/PowerUtilities.robot
Resource  ../Resources/PO/File.robot
Resource  ../Resources/PO/Constants.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***


*** Test Cases ***

Check "Water" usage for the day
    [Documentation]  Check the water usage for the day
    [Tags]  WaterUsage
    WaterUtilities.Open Login Page
    WaterUtilities.Confirm Page Open
    WaterUtilities.Input Login name
    WaterUtilities.Input Login Credential
    WaterUtilities.Submit Form
    WaterUtilities.Confirm Login Success


    # Read needed details from webpage
    ${latest_reading} =  WaterUtilities.Read Latest Usage
    
    ${date} =   WaterUtilities.Read Date


    # Logout from web page
    WaterUtilities.Log Out

    ${todays_use} =  Write to File and Return Daily usage   ${WATER_USAGE_FILE}   ${date}     ${latest_reading}     ${WATER_READING_PRECISION}

    Log  Water usage on ${date} is ${todays_use}

    Sleep  2s


Check "Power" usage for the day
    [Documentation]  Check the Power usage for the day
    [Tags]  PowerUsage
    #Commons.Begin Web Test
    PowerUtilities.Open Login Page
    PowerUtilities.Confirm Page Open
    PowerUtilities.Input Login name
    PowerUtilities.Input Login Credential
    PowerUtilities.Submit Form
    PowerUtilities.Confirm Login Success


    # Read needed details from webpage
    ${latest_reading} =  PowerUtilities.Read Latest Usage
    
    ${date} =   PowerUtilities.Read Date


    # Logout from web page
    PowerUtilities.Log Out

    ${todays_use} =  Write to File and Return Daily usage   ${POWER_USAGE_FILE}   ${date}     ${latest_reading}     ${POWER_READING_PRECISION}

    Log  Power usage on ${date} is ${todays_use}

    Sleep  2s



Test "Water" website part
    [Documentation]  Test only Water website part
    [Tags]  WaterWebTest
    WaterUtilities.Open Login Page
    WaterUtilities.Confirm Page Open
    WaterUtilities.Input Login name
    WaterUtilities.Input Login Credential
    WaterUtilities.Submit Form
    WaterUtilities.Confirm Login Success

    # Read needed details from webpage
    ${latest_reading} =  WaterUtilities.Read Latest Usage
    
    ${date} =   WaterUtilities.Read Date

    # Logout from web page
    WaterUtilities.Log Out
    
    Log  Water reading on ${date} is ${latest_reading}

Test "Power" website part
    [Documentation]  Test only Power website part
    [Tags]  PowerWebTest
    PowerUtilities.Open Login Page
    PowerUtilities.Confirm Page Open
    PowerUtilities.Input Login name
    PowerUtilities.Input Login Credential
    PowerUtilities.Submit Form
    PowerUtilities.Confirm Login Success

    # Read needed details from webpage
    ${latest_reading} =  PowerUtilities.Read Latest Usage
    
    ${date} =   PowerUtilities.Read Date

    # Logout from web page
    PowerUtilities.Log Out
    
    Log  Power reading on ${date} is ${latest_reading}

Test "Water" File part
    [Documentation]  Test only Water file part
    [Tags]  WaterFileTest
    ${latest_reading} =  Set variable  0672350

    ${date} =   Set variable  9/14/2017

    ${todays_use} =  Write to File and Return Daily usage   ${WATER_USAGE_FILE}   ${date}     ${latest_reading}     ${WATER_READING_PRECISION}
    
    Log  Power usage on ${date} is ${todays_use}

    Sleep  2s

Test "Power" File part
    [Documentation]  Test only Power file part
    [Tags]  PowerFileTest
    ${latest_reading} =  Set variable  92021.071

    ${date} =   Set variable  9/13/2017

    ${todays_use} =  Write to File and Return Daily usage   ${POWER_USAGE_FILE}   ${date}     ${latest_reading}     ${POWER_READING_PRECISION}
    
    Log  Power usage on ${date} is ${todays_use}

    Sleep  2s


