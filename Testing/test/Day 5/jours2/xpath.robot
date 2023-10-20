*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Example of locator
    Open Browser    url=https://www.jumia.ma/    browser=Edge
    Input Text    xpath=//input[@name='q']    mobile
    Input Text    xpath=//input[starts-with(@name,'q')]    mobile
    Input Text    xpath=/html/body/div[1]/header/section/form/div/input[@name='q']    mobile
    Input Text    xpath=//input[contains(@placeholder,'Cherchez un produit, une marque ou une catégorie')]    mobile
    Element Text Should Be    xpath=//*[@id="jm"]    43800 résultats
