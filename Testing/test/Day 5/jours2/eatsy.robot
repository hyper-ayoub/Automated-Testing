*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login with correct Username and Password
    Open Browser     url=https://www.etsy.com/login                                                   browser=Edge
    Input Text       id:join_neu_email_field                                                          ibtihalabouh@gmail.com
    Input Text       password                                                                         kitty123
    Click Button     name:submit_attempt
    Wait Until Page Contains Element    class:wt-circle
    Close Browser