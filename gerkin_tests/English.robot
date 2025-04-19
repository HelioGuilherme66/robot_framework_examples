Language: English

*** Settings ***
Documentation     Feature: Login to system
...               \ \ As a user of the system
...               \ \ I want to access my account
...               \ \ To view my personal data
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Variables         bank_variables${lang}.py

*** Variables ***
${lang}           ${EMPTY}    # Possible values, ${EMPTY}, _pt_pt, _pt_br

*** Test Cases ***
Login with valid credentials
    Given that the user is at Login page
    When they type the email user@email.com in the field User Name
    And they type the password somesecret123 in the field Password
    And clicks the button Enter
    Then they should be redirected to the User page
    And they should see the message Welcome, user

*** Keywords ***
that the user is at Login page
    Open Browser    file:///${CURDIR}/app/demo_app${lang}.html
    Wait Until Page Contains    ${object['bank_title']}

they type the email ${email} in the field User Name
    Input Text    id=email_field    ${email}

they type the password ${senha} in the field Password
    Input Password    id=password_field    ${senha}

clicks the button ${botão}
    VAR    ${element}    ${object['${botão}']}
    Click Button    ${element}

they should be redirected to the User page
    Page Should Contain Element    id=user_profile

they should see the message ${mensagem}
    ${message}=    Get Text    id=user_profile
    Should Be Equal    ${message}    ${object['${mensagem}']}
