*** Settings ***
Library  Selenium2Library

*** Variables ***
${BROWSER}=  chrome
#${DRIVER_PATH} =  C:/WebDrivers/bin/chromedriver.exe

*** Keywords ***
Begin Web Test
    #Create Webdriver    Chrome    executable_path=${DRIVER_PATH}
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser