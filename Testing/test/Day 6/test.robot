*** Settings ***
Library          SeleniumLibrary
Library          TestSuite2.robot

*** Variables ***
@{list}          item1    item2    item3

*** Test Cases ***
Example
    Run Keyword Test    Example Test
