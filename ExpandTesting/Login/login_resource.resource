
*** Settings ***
Library           SeleniumLibrary    timeout=15
Variables         login_variables.py

*** Keywords ***
Launch the browser
    Open Browser

Navigate to the login page URL
    Go To    ${login_url}
    Maximize Browser Window    # We do this because advertisements take lot of space
    Delete All Cookies    # We do this to attempt not having ads

Verify that the login page is displayed successfully
    Page Should Contain Element    ${id_username}
    Page Should Contain Element    ${id_password}
    Page Should Contain Element    ${btn_login}
    Press Keys    //body    PAGE_DOWN    # First element needs to be in viewport
    Sleep    2 seconds
    Scroll Element Into View    ${id_username}    # We do this because advertisements take lot of space

Ensure the user remains on the login page
    Location Should Be    ${login_url}

Enter an incorrect Username (e.g., "${username}")
    Enter Username: ${username}

Enter Username: ${username}
    Press Keys    //body    ARROW_DOWN    # Element needs to be in viewport
    Sleep    2 seconds
    Scroll Element Into View    ${id_username}
    Input Text    ${id_username}    ${username}

Enter an incorrect Password (e.g., "${password}")
    Enter Password: ${password}

Enter Password: ${password}
    Press Keys    //body    ARROW_DOWN    # Element needs to be in viewport
    Press Keys    //body    ARROW_DOWN
    Sleep    2 seconds
    Scroll Element Into View    ${id_password}
    Input Password    ${id_password}    ${password}

Click the Login button
    Press Keys    //body    ARROW_DOWN    # Element needs to be in viewport
    Sleep    2 seconds
    Scroll Element Into View    ${btn_login}
    Click Button    ${btn_login}
    Sleep    2 seconds

Verify that the user is redirected to the ${sub_page} page
    Location Should Be    ${root_url}${sub_page}

Confirm the success message "${message}" is visible
    _validate message is visible    ${message}

Verify that an error message "${message}" is displayed
    _validate message is visible    ${message}

_validate message is visible
    [Arguments]    ${message}
    Element Text Should Be    ${id_flash}    ${message}
    Element Should Be Visible    ${id_flash}

Verify that a Logout button is displayed
    Press Keys    //body    PAGE_DOWN    # First element needs to be in viewport
    Sleep    2 seconds
    Scroll Element Into View    ${btn_logout}    # We do this because advertisements take lot of space
    Element Should Be Visible    ${btn_logout}
    Sleep    2 seconds
    Capture Page Screenshot
