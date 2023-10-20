*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
*** Variables ***
${url}         https://www.avito.ma/fr/account/signup
${browser}     chrome
${nom}         El jalili
${email}       eljalilihikmat@outlook.fr
${tel}         0704701695
${password}    @Eljalili1
*** Test Cases ***
test
    LunchBrowser
    Sleep            2s
    CreateAccount
*** Keywords ***
LunchBrowser
    Open Browser    ${url}    ${browser}
    Sleep           2s
CreateAccount
    Input Text    //*[@id="name"]                                      ${nom}
    Sleep         1s
    Input Text    //*[@id="email"]                                     ${email}
    Sleep         1s
    Input Text    //*[@id="phone"]                                     ${tel}
    Sleep         1s
    Input Text    //*[@id="password"]                                  ${password}
    Sleep         1s
    Input Text    //*[@id="passwordConfirmation"]                      ${password}
    Sleep         1s
    Input Text    //input[starts-with(@class,'sc-cbdw5v-4 hoeJFT')]    Casablanca     
    Sleep         1s
    Press Keys     //input[starts-with(@class,'sc-cbdw5v-4 hoeJFT')]    \\13

    Select From List by Value    //input[starts-with(@class,'sc-cbdw5')]                         Casablanca
    # Sleep                        3s
    # Select Checkbox              //input[starts-with(@class,'sc-1nv0bef-0 jSblzA')]
    # Sleep                        3s
    Click Button    //*[@id="__next"]/div/main/div[1]/div[2]/div/div[2]/div[4]/form/button




















