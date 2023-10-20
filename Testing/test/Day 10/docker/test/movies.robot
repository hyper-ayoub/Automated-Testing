*** Settings ***

Library     RequestsLibrary

*** Variables ***
${BASE_URL}    https://moviesdatabase.p.rapidapi.com/titles
${HEADERS}    X-RapidAPI-Key:6fc4363381mshccc938c5300e831p1a2d4cjsnc09dc6d2a411    X-RapidAPI-Host:moviesdatabase.p.rapidapi.com

*** Test Cases ***
Test API Request
    Create Session    movies    ${BASE_URL}
    &{headers}    Create Dictionary    X-RapidAPI-Key    6fc4363381mshccc938c5300e831p1a2d4cjsnc09dc6d2a411    X-RapidAPI-Host    moviesdatabase.p.rapidapi.com
    ${response}    GET On Session    movies    /    headers=${headers}    verify=${True}
    Should Be Equal    ${response.status_code}    200
    Log    Response: ${response.text}

*** Keywords ***
Should Be Equal
    [Arguments]    ${actual}    ${expected}
    Should Be Equal As Integers    ${actual}    ${expected}
