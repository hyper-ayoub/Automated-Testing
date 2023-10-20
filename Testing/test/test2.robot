*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${url}         https://www.jumia.ma/
${browser}     chrome
${email}       fcaaisular78412@marketstore.pw
${password}    Test123@
${nom}         yas
${prenom}      yassine
${tel}         0708345678


*** Keywords ***
LunchBrowser
    Open Browser    ${url}    ${browser}
    Sleep           2s
Search
    Input Text       //*[@id="fi-q"]                                     iphone 14
    Click Button     //*[@id="search"]/button
    Sleep            2s
    Click Element    //*[@id="jm"]/header/section/div[2]/div[1]/label
    Sleep            2s
    Click Element    //*[@id="dpdw-login-box"]/div/div/a
    Sleep            2s

CreateAccount
    Input Text         //*[@id="input_identifierValue"]                             ${email}
    Sleep              2s
    Click Element      //button[starts-with(@class,'mdc-button')]
    Sleep              2s
    Input Text         //input[starts-with(@class,'mdc-text')]                      ${password}
    Input Text    //input[starts-with(@class,'mdc-text-field__input confirm-password-input')]    ${password}
    Sleep              2s
    Click Element    //button[starts-with(@class,'mdc-button mdc-button--touch mdc-button--raised to-personal-details mdc-ripple-upgraded')]
    Sleep              2s
    Input Text         //*[@id="input_first_name"]                                  ${prenom}
    Input Text         //*[@id="input_last_name"]                                   ${nom}
    Input Text         //*[@id="card_profile_details"]/div[4]/div[2]/label/input    ${tel}
    Click Element    //button[starts-with(@class,'mdc-button mdc-button--touch mdc-button--raised to-personal-details-part-2')]
    Sleep              2s
    Click Element      //*[@id="gender"]
    Sleep              2s
    Click Element      //*[@id="gender"]/div[2]/ul/li[1]
    Input Text         //*[@id="input_birth_date"]                                  01/01/2000
    Select Checkbox    //*[@id="acceptTC"]
    Sleep              2s
    Click Element      //*[@id="confirmBtn"]
    Sleep              10s


*** Test Cases ***
First Test
    LunchBrowser
   
    Search
    CreateAccount
    Close Browser


