*** Settings ***

Library    SeleniumLibrary
Documentation
...    My First Test
...    This test will Verify Google
*** Keywords ***

Navigate To Google
    Open Browser    https://www.google.com    browser=Edge

Verify Page Contains Google
    ${Get_title}=                 Get Title
    Should Be Equal As Strings    ${Get_title}    Google
    Close Browser

*** Test Cases ***

Open Google & Verify Google
    Navigate To Google
    Verify Page Contains Google