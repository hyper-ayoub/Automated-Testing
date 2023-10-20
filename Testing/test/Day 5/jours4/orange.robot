*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${BROWSER}    chrome
${LOGIN_URL}    https://www.orangedigitalcenters.com/login
${email}    yousseflehmam3@gmail.com
${CORRECT_PASSWORD}    s@123
${INCORRECT_PASSWORD}    wrongpassword
${SIGNUP_URL}    https://www.orangedigitalcenters.com/signUp
${ERROR_MESSAGE}    Login error

*** Keywords ***
Login With Wrong Password Redirects to Signup
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    //*[@id="basic_email"]    ${email}
    Sleep    2s
    Input Text    //*[@id="basic_password"]    ${INCORRECT_PASSWORD}
    Sleep    2s
    Click Button    //*[@id="basic"]/div[4]/div/div/div/button
    Sleep    2s
    Wait Until Page Contains   ${ERROR_MESSAGE}
    Go To    ${SIGNUP_URL}

SIGNUP
    Input Text    //*[@id="basic_odcCountry"]     DD
    Sleep    2s
    Press Keys    //*[@id="basic_odcCountry"]    RETURN
    Sleep    2s
    Input Text    //*[@id="basic_email"]    ${email}
    Sleep    2s
    Input Text    //*[@id="basic_password"]    ${CORRECT_PASSWORD}
    Sleep    2s
    Input Text    //*[@id="basic_firstName"]    Youssef
    Sleep    2s
    Input Text    //*[@id="basic_lastName"]    Lehmam
    Sleep    2s
    Click Element     id:basic_gender 
    Sleep    2s
    Click Element    css=.ant-select-item-option-content:contains("Male")

    Sleep    2s
    Input Text    //*[@id="basic_birthDay"]    1995-01-01
    Select From List By Value   //*[@id="profession"]   Student
    
*** Test Cases ***
First Test
    Login With Wrong Password Redirects to Signup
    SIGNUP
