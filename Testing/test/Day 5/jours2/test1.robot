*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Edge
${URL}        https://www.jumia.ma/

*** Test Cases ***
Inspecter les éléments sur Jumia.ma
    Open Browser               ${URL}                            ${BROWSER}
    Maximize Browser Window
    # Wait Until Page Contains Element    id:fi-q
    Press Keys                 xpath://*[@id="search"]/button    RETURN
    # Wait Until Page Contains Element    xpath://*[@id="search"]/button
    # Wait Until Page Contains Element    xpath://*[@id="jm"]/header/section/div[2]/div[1]/labele
    Click Button               xpath://*[@id="search"]/button
    Close Browser
