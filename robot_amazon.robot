*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           Selenium2Library
Library    OperatingSystem


*** Variables ***
${LOGIN URL}      https://www.amazon.in/
${BROWSER}        Chrome
${text}     xpath=//*[@id="twotabsearchtextbox"]
${search_button}    nav-input
*** Test Cases ***
Valid Login
    Open Browser To Load Amazon
    Practical Tutorial Data Reading


*** Keywords ***

Open Browser To Load Amazon
    Open Browser    ${LOGIN URL}    ${BROWSER}
    # you can check the Title of the web page opened by below
    Title Should Be      Online Shopping site in India: Shop Online for Mobiles, Books, Watches, Shoes and More - Amazon.in

Practical Tutorial Data Reading
    input text      ${text}  Test Definition
    Click Element   class:${search_button}
    sleep     5s
    Close Browser


Input Password
    [Arguments]    ${password}
    Input Text    pass    ${password}

Submit Credentials
    Click Button    login

Welcome Page Should Be Open
    Title Should Be    Webmail Login
