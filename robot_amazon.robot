*** Settings ***
Documentation   A  simple amazon .com test suite
Library  Selenium2Library

*** Variables ***

${Browser}  =  Google Chrome
${START_URL}  =  https://www.amazon.com

*** Test Case ***

Simple Web Opening Test
    [Documentation]  A simple amazon site opening
    [Tags]  Smoke
    Open Browser  ${START_URL}  ${Browser}
    wait Until  Page Contains  Shop by
    Input Text  css=#twotabsearchtextbox  Ferrari 458
    Click Button  css=#nav-search > form >div.nav-right > div > input
    wait Until Page Contains  result for
    Close Browser