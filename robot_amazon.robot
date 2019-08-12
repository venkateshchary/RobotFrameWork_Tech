*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           Selenium2Library
Library    OperatingSystem


*** Variables ***
${LOGIN URL}      https://www.amazon.in/
${BROWSER}        Chrome
${text}     xpath=//*[@id="twotabsearchtextbox"]
${search_button}    nav-input
${all_book_names}   //a[@class =a-link-normal.a-text-normal']//span[@class='a-size-medium.a-color-base a-text-normal']
*** Test Cases ***
Valid Login
    Open Browser To Load Amazon
    Practical Tutorial Data Reading
    Book finding


*** Keywords ***

Open Browser To Load Amazon
    Open Browser    ${LOGIN URL}    ${BROWSER}
    # you can check the Title of the web page opened by below
    Title Should Be      Online Shopping site in India: Shop Online for Mobiles, Books, Watches, Shoes and More - Amazon.in

Practical Tutorial Data Reading
    input text      ${text}  Test Definition
    Click Element   class:${search_button}
    sleep     5s
    # Close Browser

Book finding
    ${count}=    Get Element Count    ${all_book_names}
    Log    Num value is ${count}
    : FOR    ${INDEX}    IN RANGE    1    2
    \    ${name}=    Get Text    xpath=${all_book_names}
    \    Log    text is ${name}

Input Password
    [Arguments]    ${password}
    Input Text    pass    ${password}

Submit Credentials
    Click Button    login

Welcome Page Should Be Open
    Title Should Be    Webmail Login
