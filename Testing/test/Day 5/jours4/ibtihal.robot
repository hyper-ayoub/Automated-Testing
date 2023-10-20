*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Test Cases ***
test
    Open Browser    https://www.skyscanner.fr/      browser=chrome
    Sleep           3s
    Input Text     xpath=//*[@id="originInput-input"]    casablanca
    sleep           5s