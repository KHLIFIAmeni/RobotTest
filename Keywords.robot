*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Navigate to URL
    [Arguments]    ${baseurl}   
    Open Browser    ${baseurl}    Chrome
    Maximize Browser Window
    Title Should Be    Your Store
Creation de nouveau compte avec succes
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${tel}    ${password}
    Click Element    xpath=//body/div[@class='mz-pure-container']/div[@id='container']/header[@class='header']/div[@id='main-navigation']/div[@id='entry_217831']/div[@class='entry-section container d-none d-md-flex flex-row align-items-center']/div[@id='entry_217834']/nav[@class='navbar navbar-expand-sm hoverable navbar-default bg-default horizontal']/div[@id='widget-navbar-217834']/ul[@class='navbar-nav horizontal']/li[6]/a[1]
    Page Should Contain    New Customer
    Click Element    xpath=//a[normalize-space()='Continue']
    Page Should Contain    Register Account
    Input Text    name=firstname    ${firstname}
    Input Text    name=lastname    ${lastname}
    Input Text    name=email    ${email}
    Input Text    name=telephone    ${tel}
    Input Text    name=password    ${password}
    Input Text    name=confirm    ${password}  
    Select Checkbox   xpath=//input[@id='input-agree']
    Click Button    xpath=//input[@value='Continue']
    Wait Until Page Contains    Congratulations! Your new account has been successfully created!
    Close Browser
Sign In
    [Arguments]    ${email}    ${pwd}
    Click Element    xpath=//body/div[@class='mz-pure-container']/div[@id='container']/header[@class='header']/div[@id='main-navigation']/div[@id='entry_217831']/div[@class='entry-section container d-none d-md-flex flex-row align-items-center']/div[@id='entry_217834']/nav[@class='navbar navbar-expand-sm hoverable navbar-default bg-default horizontal']/div[@id='widget-navbar-217834']/ul[@class='navbar-nav horizontal']/li[6]/a[1]
    Page Should Contain    Returning Customer
    Input Text    css=#input-email   ${email}
    Input Password    css=#input-password    ${pwd}
    Click Button    xpath=//input[@value='Login']
Foget Password
    [Arguments]    ${email}
    Click Element    xpath=//body/div[@class='mz-pure-container']/div[@id='container']/header[@class='header']/div[@id='main-navigation']/div[@id='entry_217831']/div[@class='entry-section container d-none d-md-flex flex-row align-items-center']/div[@id='entry_217834']/nav[@class='navbar navbar-expand-sm hoverable navbar-default bg-default horizontal']/div[@id='widget-navbar-217834']/ul[@class='navbar-nav horizontal']/li[6]/a[1]
    Click Link    xpath=//div[@class='form-group']//a[normalize-space()='Forgotten Password']
    Wait Until Page Contains    Forgot Your Password?
    Input Text    name=email    ${email}
    Click Button    xpath=//button[normalize-space()='Continue']

    Wait Until Page Contains    An email with a confirmation link has been sent your email address. 
# Add Product to Store
       