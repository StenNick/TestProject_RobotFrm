*** Settings ***
Library  SeleniumLibrary
Resource  settings.robot

*** Test Cases ***
Registration
    Open Chrome Browser
    Registration vk
    Confirmation of registration

    Close Chrome Browser
