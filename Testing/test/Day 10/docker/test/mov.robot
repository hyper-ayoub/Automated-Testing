*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     BuiltIn

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
    ${movies}    Set Variable    ${response.json()["results"]}   # Extract 'results' list of movies

    # Test cases for the movie list
    Test Movie List Contains Movies    ${movies}
    Test Movie List Attributes    ${movies}

*** Keywords ***
Should Be Equal
    [Arguments]    ${actual}    ${expected}
    Should Be Equal As Integers    ${actual}    ${expected}

Test Movie List Contains Movies
    [Arguments]    ${movies}
    Should Not Be Empty    ${movies}
    ${movie_count}    Get Length    ${movies}
    Log    There are ${movie_count} movies in the list.

Test Movie List Attributes
    [Arguments]    ${movies}
    FOR    ${movie}    IN    @{movies}
        ${is_title_present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${movie}    title
        ${is_genre_present}    Run Keyword And Return Status    Dictionary Should Contain Key    ${movie}    genre
        Log    Movie Title: ${movie["titleText"]["text"]}
        Log    Genre: ${movie["titleType"]["text"]}

    END
