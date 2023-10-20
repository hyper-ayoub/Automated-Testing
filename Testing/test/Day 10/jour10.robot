*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    Collections
Library    String
Library    OperatingSystem

*** Variables ***
${BROWSER}    chrome
${url}    http://www.advantageonlineshopping.com/
${random_number}    ${EMPTY}
${test_word}    l
${password}    Test@123
${confirm_password}    Test@123
${first_name}    Test
${last_name}    User
${phone_number}    1234567890
${city}    Test
${address}    Test
${state}    Test
${postal_code}    123456
${payusername}    Testlehmampay
${paypassword}    Test@123
${buy}    http://www.advantageonlineshopping.com/#/product/15?viewAll=phone
${buy2}    http://www.advantageonlineshopping.com/#/product/25
${buy3}    http://www.advantageonlineshopping.com/#/product/21
&{test_caps}        browser=chrome
${remote_url}=    http://localhost:4444/wd/hub

*** Keywords ***
Open Session
    [Arguments]    ${capabilities}    ${test_url}
    open browser    remote_url=${remote_url}     desired_capabilities=${capabilities}   url=${test_url}


NAVIGATION
    Open Session   ${test_caps}    ${url}
    Maximize Browser Window
    Wait Until Page Contains     OUR PRODUCTS   #ID1
    Click Element    id=menuUserLink
    Wait Until Page Contains     Forgot your password?
    Sleep    2s
    Click Element    //a[@class="create-new-account ng-scope"]    #ID2
    Wait Until Page Contains     CREATE ACCOUNT    #ID3
    Sleep    2s

SIGNUP    
    #ID4
    ${email}    Catenate    SEPARATOR=.    hbc3j    ${test_word}${random_number}@inbox.testmail.app
    ${username}    Catenate    SEPARATOR=.    hbc3j    ${test_word}${random_number}
    Input Text    //input[@name="usernameRegisterPage"]    ${username}
    Input Text    //input[@name="emailRegisterPage"]    ${email}
    Input Text    //input[@name="passwordRegisterPage"]    ${password}
    Input Text    //input[@name="confirm_passwordRegisterPage"]    ${confirm_password}
    Input Text    //input[@name="first_nameRegisterPage"]    ${first_name}
    Input Text    //input[@name="last_nameRegisterPage"]   ${last_name}
    Execute JavaScript    window.scrollBy(0, 200)
    Sleep    2s
    Input Text    //input[@name="phone_numberRegisterPage"]    ${phone_number}
    Select From List By Value    //*[@id="formCover"]/div[3]/div[1]/sec-view[1]/div/select    object:296
    Input Text    //input[@name="cityRegisterPage"]    ${city}
    Input Text    //input[@name="addressRegisterPage"]    ${address}
    Input Text    //input[@name="state_/_province_/_regionRegisterPage"]    ${state}
    Input Text    //input[@name="postal_codeRegisterPage"]    ${postal_code}
    Click Element    //input[@name="i_agree"]
    Execute JavaScript    window.scrollBy(0, 200)
    Sleep    3s
    Click Button    id=register_btn    #ID5
    Wait Until Page Contains     OUR PRODUCTS
    Sleep    2s
    Close Browser    

SIGNIN
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains     OUR PRODUCTS   
    Click Element    id=menuUserLink
    Wait Until Page Contains     Forgot your password?
    Sleep    2s
    ${username}    Catenate    SEPARATOR=.    hbc3j    ${test_word}${random_number}
    Input Text    //input[@name="username"]    ${username}
    Input Text    //input[@name="password"]    ${password}
    Sleep    2s
    Select Checkbox    //input[@name="remember_me"]    
    Sleep    2s
    Click Button    id=sign_in_btn    
    Wait Until Page Contains     OUR PRODUCTS    
    Sleep    2s

SEARCH_DELETE
    Click Element  //*[@id="search"]
    Sleep    2s
    Input Text   id=autoComplete    hp roar
    Sleep    2s
    Click Element  //a[@class="product ng-scope"]    
    Wait Until Page Contains     HP ROAR PLUS WIRELESS SPEAKER    
    Sleep    2s
    Click Element    //div[@class="fixedBtn"]    
    Sleep    2s
    Click Element    id=shoppingCartLink   
    Wait Until Page Contains    SHOPPING CART
    Sleep    2s
    Reload Page
    Wait Until Page Contains    SHOPPING CART
    Sleep    2s
    Click Element    //a[@class="remove red ng-scope"]
    Wait Until Page Contains    Your shopping cart is empty
    Sleep    2s

BUY
    Go To    ${buy}
    Wait Until Page Contains    BEATS STUDIO 2
    Sleep    2s
    Click Element    //div[@class="fixedBtn"]    
    Sleep    2s
    Click Element    id=shoppingCartLink   
    Wait Until Page Contains    SHOPPING CART
    Sleep    2s
    Reload Page
    Wait Until Page Contains    SHOPPING CART
    Sleep    2s
    Click Button    //*[@id="checkOutButton"]
    Wait Until Page Contains    ORDER PAYMENT
    Sleep    2s
    Click Button    id=next_btn
    Wait Until Page Contains    Choose payment method below
    Execute JavaScript    window.scrollBy(0, 200)
    sleep    2s
    Click Element    xpath=//input[@name='safepay_username']
    Input Text    xpath=//input[@name='safepay_username']    ${payusername}
    Sleep    2s
    Click Element    xpath=//input[@name='safepay_password']
    Input Text    xpath=//input[@name='safepay_password']    ${paypassword}
    Sleep    2s
    Unselect Checkbox    //input[@name="save_safepay"]    
    Sleep    10s
    Click Button    id=pay_now_btn_SAFEPAY
    Wait Until Page Contains    Your tracking number is
    Sleep    2s

COLOR
    Go To    ${buy2}
    Wait Until Page Contains    BOSE SOUNDLINK
    Sleep    2s
    Click Element    //span[@class="bunny productColor ng-scope BLUE"]    
    Click Element    //div[@class="fixedBtn"]
    Sleep    2s
    Click Element    id=shoppingCartLink   
    Wait Until Page Contains    SHOPPING CART
    Sleep    2s
    Reload Page
    Wait Until Page Contains    SHOPPING CART
    Sleep    2s


EDIT
    Go To    ${buy3}
    Wait Until Page Contains    HP ROAR PLUS WIRELESS
    Click Element    //div[@class="fixedBtn"]
    Sleep    2s
    Click Element    id=shoppingCartLink   
    Wait Until Page Contains    SHOPPING CART
    Sleep    2s
    Reload Page
    Wait Until Page Contains    SHOPPING CART
    Sleep    2s
    Click Element    //a[@class="edit ng-scope"]
    Wait Until Page Contains    HP ROAR PLUS WIRELESS SPEAKER
    Sleep    2s
    Click Element    //span[@title="PURPLE"]    
    Sleep    2s
    Click Element    //div[@class="fixedBtn"]
    Sleep    2s

append Email
    ${random_number}=    Evaluate    random.randint(1000, 9999)
    Set Global Variable    ${RANDOM_NUMBER}    ${random_number}
    ${username}    Catenate    SEPARATOR=.    hbc3j    ${test_word}${random_number}
    Append To File     ./mails.txt  ${username}${\n}

*** Test Cases ***
First Test
    append Email
    NAVIGATION
    SIGNUP
    SIGNIN
    SEARCH_DELETE
    BUY
    COLOR
    EDIT
    BUY
