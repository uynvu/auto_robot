*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***

[Q1] - Login Guru 99
    [Documentation]    Đăng nhập Guru 99
    [tags]   login
    Truy cập Guru
    Nhập email password
    Chọn button sign in
    Verify login
[Q2] - Verify Tiki.vn
    [tags]   tiki
    Truy cập Tiki.vn
    Tìm kiếm cụm từ "nồi chiên"
    Click vào "nồi chiên không dầu" xuất hiện trong cụm gợi ý tìm kiếm sau khi thực hiện bước 2
    Click vào sản phẩm thứ 4
    Click "Chọn mua"
    Verify popup có chứa "Xin chào"
[Q3] - Verify GG
    [tags]   msb
    Truy cập google.com
    Tìm kiếm từ khóa "MSB"
    Click vào kết quả tìm kiếm đầu tiên
    Tắt Popup
    Verify trang có chứa "Chọn thẻ phù hợp với bạn"

*** Keywords ***

Truy cập Guru
   Open Browser  https://demo.guru99.com/test/login.html   chrome
Nhập email password
   Input Text    //input[@id='email']   yeondethuon@gmail.com
   Input Password    //input[@id='passwd']     88888888
Chọn button sign in
   Click Button    //button[@id='SubmitLogin']
Verify login
   Wait Until Element Is Visible    //h3[contains(text(),'Successfully Logged in...')]


Truy cập Tiki.vn
   Open Browser     https://tiki.vn/   chrome
Tìm kiếm cụm từ "nồi chiên"
   Input Text    //input[@data-view-id='main_search_form_input']  nồi chiên 
Click vào "nồi chiên không dầu" xuất hiện trong cụm gợi ý tìm kiếm sau khi thực hiện bước 2
    Wait Until Element Is Visible    //div[normalize-space()='nồi chiên không dầu']
   Click Element    //div[normalize-space()='nồi chiên không dầu']
Click vào sản phẩm thứ 4
   Wait Until Element Is Visible    //div[@data-view-id='product_list_container']/div[4]  5s
   Click Element    //div[@data-view-id='product_list_container']/div[4]
Click "Chọn mua"
   Wait Until Element Is Visible   //button[@class='btn btn-add-to-cart']  5s
   Click Element    //button[@class='btn btn-add-to-cart']
Verify popup có chứa "Xin chào"
    Wait Until Element Is Visible    //h4[contains(text(),'Xin chào,')]    


Truy cập google.com
    Open Browser   https://www.google.com/   chrome
Tìm kiếm từ khóa "MSB"
    Input Text    //textarea[@id='APjFqb']    MSB
    Press Keys    //textarea[@id='APjFqb']    ENTER
Click vào kết quả tìm kiếm đầu tiên
    Wait Until Element Is Visible    //div[@id='search']//a[@href='https://www.msb.com.vn/vi/']  5s
    Click Element     //div[@id='search']//a[@href='https://www.msb.com.vn/vi/']  
Tắt Popup
    Click Element    //div[@id='fragment-34202-joci']//span[@class='pop-up-porlet-close-btn']
    Wait Until Element Is Not Visible    //div[@id='fragment-34202-joci']//span[@class='pop-up-porlet-close-btn']    3s
 Verify trang có chứa "Chọn thẻ phù hợp với bạn"
    Wait Until Element Is Visible    //div[contains(text(),'Chọn thẻ phù hợp với bạn')]
