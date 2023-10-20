*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${browser}   Edge
${url}   https://atlasgaming.ma/
${email}   kulmolekka@gufum.com
${password}   ayoub
${First name}    ayoub   
${last name}    bnoune
${city}  casablanca
${address}  sidi Maarouf
${phone number}  +212684041044







     
     

*** Keywords ***
LunchBrowser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window 
    Sleep    4s
    

sign up             
  
    click Element   //li[@id='menu-item-30384']//a[normalize-space()='Mon compte']
     sleep  3s 
     Input text      //*[@id="reg_email"]        ${email}
     sleep  3s 
     click Button    //*[@id="customer_login"]/div[2]/form/p[4]/button
     sleep  3s


sign in             
    Go To    https://atlasgaming.ma/contact/
    Sleep    2s
    click Element   //li[@id='menu-item-30384']//a[normalize-space()='Mon compte']
    sleep  3s 
    Input text      //*[@id="username"]          ${email}
    sleep  3s 
    Input text      //*[@id="password"]          ${password} 
    click Element   //span[normalize-space()='Se souvenir de moi'] 
    sleep  3s
    click Button    //*[@id="customer_login"]/div[1]/form/p[3]/button 
    sleep  3s

 search 
  Input Text     //*[@id="dgwt-wcas-search-input-1"]  Logitech G Pro avec capteur HERO 25K

  Sleep  3s 
  Press Keys     //*[@id="dgwt-wcas-search-input-1"]         ENTER 
  sleep  1s
  Click Element     //*[@id="div_block-185-5336-1"] 
  Sleep   1s  
   Click Button    //*[@id="-product-cart-button-30-5404"]/form/button
   Sleep  3s 
  
  
  
  
  
 

 

add product 
   click Button   //*[@id="-product-cart-button-30-5404"]/form/button 
   sleep  3s
   Click Element    //header[@id='_header-44-16']//bdi[1] 
   Sleep   3s
   Click Element     //*[@id="-mini-cart-334-16"]/div/p[2]/a[1]
    Sleep    3s
    



coupon code
     Input Text          //input[@id='coupon_code']   dddddddd
     Sleep  3s 
     Click Button        //button[@name='apply_coupon'] 
     Sleep  3s 
    Click Element   //a[@class='checkout-button button alt wc-forward']
     Sleep  3s
      
Select product 
              Input Text         //*[@id="billing_first_name"]  ayoub
              Input Text         //*[@id="billing_last_name"]   bnoune    
              Input Text          //*[@id="billing_last_name"]  Sidi maarouf
              Input Text         //*[@id="billing_city"]   casablanca
              Input Text         //*[@id="billing_postcode"]  20000
              Input Text         //*[@id="billing_phone"]   0629802875
              Input Text         //*[@id="billing_email"]  saridoy155@miqlab.com
              Click Element      //span[normalize-space()='Créer un compte ?']
              Sleep    3s 

*** test cases ***
login test
  LunchBrowser
  search
  add product 
  coupon code
 
   