*** Settings ***
Library           Selenium2Library

*** Variables ***
${TxtUsername}    id=txtUsername
${TxtPassword}    id=txtPassword
${BtnLogin}       id=btnLogin
${BtnWelcome}     id=welcome
${BtnMenuAdmin}    id=menu_admin_viewAdminModule
${BtnUserDropdown}    name=searchSystemUser[userType]
${BtnSearch}      id=searchBtn
${BtnReset}       id=resetBtn
${ChkHannah}      id=ohrmList_chkSelectRecord_3
${TxtUserUsername}    name=searchSystemUser[userName]
${BtnLogout}      xpath=//*[@id="welcome-menu"]/ul/li[2]/a
${TtlUserAdmin}    href=https://opensource-demo.orangehrmlive.com/index.php/admin/saveSystemUser?userId=1
${BtnMenuAdminQualification}    id=menu_admin_Qualifications
${BtnAdminLanguages}    id=menu_admin_viewLanguages
${BtnSave}        id=btnSave
${TxtLanguagesName}    id=language_name
${TtlLanguagesIndonesia}    text=Indonesia
${ChkIndonesia}    name=chkListRecord[]
${BtnDelete}      id=btnDel
${BtnAdd}         id=btnAdd
${LinkLogout}     href=https://opensource-demo.orangehrmlive.com/index.php/auth/logout
${TxtLogout}      xpath=//*[contains(text(),'Logout')]

*** Test Cases ***
TC_NavigateToUrl
    [Documentation]    This test case is to navigate to URL https://opensource-demo.orangehrmlive.com/
    Open Browser    https://opensource-demo.orangehrmlive.com/    Chrome
    Maximize Browser Window
    Title Should Be    OrangeHRM

TC_Login
    [Documentation]    Login
    Input Text    ${TxtUsername}    Admin
    Input Text    ${TxtPassword}    admin123
    Click Button    ${BtnLogin}
    Page Should Contain Element    ${BtnWelcome}

TC_SearchingUserByDropdown
    Click Element    ${BtnMenuAdmin}
    Select From List By Index    ${BtnUserDropdown}    2
    Click Element    ${BtnSearch}
    Page Should Not Contain Element    ${TtlUserAdmin}
    Click Element    ${BtnReset}

TC_AddDeleteQualificationLanguages
    Click Element    ${BtnMenuAdminQualification}
    Click Element    ${BtnAdminLanguages}
    Click Element    ${BtnAdd}
    Input Text    ${TxtLanguagesName}    Indonesia
    Click Element    ${BtnSave}
    Page Should Contain Element    ${ChkIndonesia}
    Select Checkbox    ${ChkIndonesia}
    Click Element    ${BtnDelete}

TC_Logout
    Click Element    ${BtnWelcome}
    Sleep    3
    Click Link    ${TxtLogout}

TC_CloseBrowser
    Close Browser
