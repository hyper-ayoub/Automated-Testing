*** Settings ***
Library          SeleniumLibrary

*** Variables ***
@{list}          item1    item2    item3

*** Keywords ***
Example Test
    FOR    ${item}    IN    @{list}
        Log    ${item}
        # Perform other actions on ${item}
    END

*** Test Cases ***
Test
    Example Test
