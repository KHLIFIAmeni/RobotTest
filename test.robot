*** Settings ***
Library    SeleniumLibrary
Resource    Keywords.robot
Resource    Variables.robot
*** Test Cases ***
# Create new account
#     [Tags]    regression
#     Navigate to URL    ${url}
#     Creation de nouveau compte avec succes    ${firstname}    ${lastname}    ${email}    ${tel}    ${password}
Login User
    Navigate to URL    ${url}
    Sign In    ${email}    ${password}
Reset mot de pass valid
    Navigate to URL    ${url}
    Foget Password    ${email}