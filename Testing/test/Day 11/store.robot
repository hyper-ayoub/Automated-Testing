*** Settings ***

Library     RequestsLibrary
Library     Collections
Library     BuiltIn
Library     OperatingSystem
Library     JSONLibrary

*** Variables ***
${BASE_URL}    https://moviesdatabase.p.rapidapi.com/titles
${HEADERS}    X-RapidAPI-Key:6fc4363381mshccc938c5300e831p1a2d4cjsnc09dc6d2a411    X-RapidAPI-Host:moviesdatabase.p.rapidapi.com
${CSV_FILE}    movies.csv
${JSON_FILE}    movies.json
${TXT_FILE}    movies.txt

*** Test Cases ***
Test API Request
    Create Session    movies    ${BASE_URL}
    &{headers}    Create Dictionary    X-RapidAPI-Key    6fc4363381mshccc938c5300e831p1a2d4cjsnc09dc6d2a411    X-RapidAPI-Host    moviesdatabase.p.rapidapi.com
    ${response}    GET On Session    movies    /    headers=${headers}    verify=${True}
    Should Be Equal    ${response.status_code}    200
    Log    Response: ${response.text}
    ${movies}    Set Variable    ${response.json()["results"]}

    # Test cases for the movie list
    Test Movie List Contains Movies    ${movies}
    Test Movie List Attributes    ${movies}
    Save Movies To CSV    ${movies}
    Save Movies To JSON    ${movies}
    Save Movies To TXT    ${movies}

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

Save Movies To CSV
    [Arguments]    ${movies}
    ${csv_content}    Create List
    Append To List    ${csv_content}    Title,Genre
    FOR    ${movie}    IN    @{movies}
        ${title}    Set Variable    ${movie["titleText"]["text"]}
        ${genre}    Set Variable    ${movie["titleType"]["text"]}
        Append To List    ${csv_content}    ${title},${genre}
    END
    ${csv_data}    Evaluate    """\n""".join(${csv_content})
    ${status}    Run Keyword And Return Status    Create File    ${CSV_FILE}
    Run Keyword If    ${status}    Append To File    ${CSV_FILE}    ${csv_data}
    Log    Movies data saved to CSV file: ${CSV_FILE}

Save Movies To JSON
    [Arguments]    ${movies}
    ${json_content}    Create List
    FOR    ${movie}    IN    @{movies}
        Append To List    ${json_content}    ${movie}
    END
    ${json_data}    Evaluate    json.dumps(${json_content}, indent=4)
    ${status}    Run Keyword And Return Status    Create File    ${JSON_FILE}
    Run Keyword If    ${status}    Append To File    ${JSON_FILE}    ${json_data}
    Log    Movies data saved to JSON file: ${JSON_FILE}

Save Movies To TXT
    [Arguments]    ${movies}
    ${txt_content}    Set Variable    # Create an empty string to store the movie data as text
    FOR    ${movie}    IN    @{movies}
        ${title}    Set Variable    ${movie["titleText"]["text"]}
        ${genre}    Set Variable    ${movie["titleType"]["text"]}
        ${txt_content}    Set Variable    ${txt_content}${title} - ${genre}\n
    END
    ${status}    Run Keyword And Return Status    Create File    ${TXT_FILE}
    Run Keyword If    ${status}    Append To File    ${TXT_FILE}    ${txt_content}
    Log    Movies data saved to TXT file: ${TXT_FILE}
