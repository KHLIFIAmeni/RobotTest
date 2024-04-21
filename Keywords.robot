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
Add Product to Store
    Input Text    xpath=//div[@id='entry_217822']//input[@placeholder='Search For Products']    HTC Touch HD
    Click Button    xpath=//button[normalize-space()='Search']
    Wait Until Page Contains    Search - HTC Touch HD
    Click Element    xpath=//a[@id='mz-product-grid-image-28-212469']//div[@class='carousel-item active']//img[@title='HTC Touch HD']
    Click Button    xpath=//div[@id='entry_216842']//button[@title='Add to Cart'][normalize-space()='Add to Cart']
    Wait Until Page Contains    Success: You have added 
    Sleep    10s    # Attendre 10 secondes 

    Click Element    css=#entry_217825 > a[aria-controls="cart-total-drawer"]

    Click Link    css=a[href="https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart"]
    Wait Until Page Contains    HTC Touch HD
Update Quantitis Product
    Clear Element Text    css=:nth-child(4) > .input-group > .form-control
    Input Text    css=:nth-child(4) > .input-group > .form-control    5
    Click Button    xpath=//button[@data-original-title='Update']
    Wait Until Page Contains    Success: You have modified your shopping cart!      
Delete Product
    Click Element    css=.btn-danger > .fas
    Wait Until Page Contains    Shopping Cart
Paiement product
    Click Button    xpath=//a[@class='btn btn-lg btn-primary']   
    Wait Until Page Contains    Shopping Cart
    Select Radio Button    id=input-payment-address-new    new
    Input Text    id=input-payment-firstname    Khlifi
    Input Text    id=input-payment-lastname    Ameni
    Input Text    id=input-payment-address-1    Le Bardo Tunis
    Input Text    id=input-payment-city    Le Bardo
    Select From List by Label    id=input-payment-country    Tunisia
    Select From List by Label    id=input-payment-zone    Tunis
    Select Checkbox    id=input-agree
    Click Button    css=#button-save    
    Wait Until Page Contains    Confirm Order
    Click Button    css=#button-confirm    
    Wait Until Page Contains    Your order has been placed!