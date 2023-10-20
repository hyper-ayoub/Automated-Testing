*** Settings ***
Documentation    This file contains test cases for the login functionality.
Library    SeleniumLibrary
Suite Setup    Open browser    ${url}    ${browser}
Suite Teardown    Close browser

*** Variables ***
${url}    https://www.jumia.ma/
${browser}     chrome
${email}     fcaaisular784998@marketstore.pw
${password}    Test123@
${nom}    yas
${prenom}    yassine
${tel}    0708345678


*** Keywords ***
Search

    Click Element    //*[@id="jm"]/header/section/div[2]/div[1]/label
    Sleep    2s
    Click Element    //*[@id="dpdw-login-box"]/div/div/a
    Sleep    2s
    
Login 
    Input Text    //*[@id="input_identifierValue"]    ${email}
    Sleep    2s
    Click Element    //button[starts-with(@class,'mdc-button')]
    Sleep    2s
    Input Text    //input[starts-with(@class,'mdc-text')]   ${password}    
    Click Element    //button[starts-with(@class,'mdc-button')]
    Sleep    0.5s
    # Wait Until Page Contains    
    Capture Page Screenshot
    [Teardown]    # Teardown steps go here
Login with Invalid Credentials
    Input Text    //*[@id="input_identifierValue"]    ${email}
    Sleep    2s
    Click Element    //button[starts-with(@class,'mdc-button')]
    Sleep    2s
    Input Text    //input[starts-with(@class,'mdc-text')]   mnnmnmn  
    Click Element    //button[starts-with(@class,'mdc-button')]
    Sleep    0.5s
    Wait Until Page Contains   Mot de passe incorrect. Réessayez ou cliquez sur "Mot de passe oublié?" pour le réinitialiser. 
    Capture Page Screenshot
    [Teardown]    # Teardown steps go here    
*** Test Cases ***
First Test
    Double Click Element    //*[@id="jm"]/header
    # Search
    # Login
    Search
    Login with Invalid Credentials
 