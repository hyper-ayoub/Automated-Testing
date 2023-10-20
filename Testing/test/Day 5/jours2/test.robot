*** Settings ***
Library    SeleniumLibrary


*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login with correct Username and Password
    Open Browser    url=https://the-internet.herokuapp.com/login    browser=Edge
    Input Text    username    tomsmith
    Input Text    password    SuperSecretPassword!
    Click Button     class:radius
    Element Should Contain    id=flash    You logged into a secure area!
    Click Link    Logout
    Close Browser

Add Tasks And Set To Complete
    Open Browser    url=https://todomvc.com/examples/angularjs/#/    browser=chrome
    Input Text    class:new-todo    Complete Robot Framework Training
    Press Keys    class:new-todo    RETURN
    Input Text    class:new-todo    Write Automated Tests
    Press Keys    class:new-todo    RETURN
    Input Text    class:new-todo    Take a nap
    Press Keys    class:new-todo    RETURN
    Element Text Should Be    class:todo-count    3 items left
    Click Element    xpath: //*[contains(text(), "Complete Robot Framework Training")]/../input
    Element Text Should Be    class:todo-count    2 items left
    Click Element    xpath: //*[contains(text(), "Write Automated Tests")]/../input
    Element Text Should Be    class:todo-count    1 item left
    Click Element    xpath: //*[contains(text(), "Take a nap")]/../input
    Element Text Should Be    class:todo-count    0 items left
    