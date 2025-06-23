*** Settings ***
Documentation     https://practice.expandtesting.com/login
Test Teardown     Close All Browsers
Library           SeleniumLibrary    timeout=10
Resource          ./login_resource.resource

*** Test Cases ***
Test Case 1: Successful
    [Documentation]    Test Case 1: Successful Login
    ...    Launch the browser.
    ...    Navigate to the login page URL.
    ...    Verify that the login page is displayed successfully.
    ...    Enter Username: practice.
    ...    Enter Password: SuperSecretPassword!.
    ...    Click the Login button.
    ...    Verify that the user is redirected to the /secure page.
    ...    Confirm the success message "You logged into a secure area!" is visible.
    ...    Verify that a Logout button is displayed.
    Launch the browser
    Navigate to the login page URL
    Verify that the login page is displayed successfully
    Enter Username: practice
    Enter Password: SuperSecretPassword!
    Click the Login button
    Verify that the user is redirected to the /secure page
    Confirm the success message "You logged into a secure area!" is visible
    Verify that a Logout button is displayed

Test Case 2: Invalid Username
    [Documentation]    Test Case 2: Invalid Username
    ...    Launch the browser.
    ...    Navigate to the login page URL.
    ...    Verify that the login page is displayed successfully.
    ...    Enter an incorrect Username (e.g., wrongUser).
    ...    Enter Password: SuperSecretPassword!.
    ...    Click the Login button.
    ...    Verify that an error message "Invalid username." is displayed.
    ...    Ensure the user remains on the login page.
    Launch the browser
    Navigate to the login page URL
    Verify that the login page is displayed successfully
    Enter an incorrect Username (e.g., "wrongUser")
    Enter Password: SuperSecretPassword!
    Click the Login button
    # Verify that an error message "Invalid username." is displayed    # Original step
    Verify that an error message "Your username is invalid!" is displayed    # Correct step - Contact Project Owner for the expected error message.
    Ensure the user remains on the login page

Test Case 3: Invalid Password
    [Documentation]    Test Case 3: Invalid Password
    ...    Launch the browser.
    ...    Navigate to the login page URL.
    ...    Verify that the login page is displayed successfully.
    ...    Enter Username: practice.
    ...    Enter an incorrect Password (e.g., WrongPassword).
    ...    Click the Login button.
    ...    Verify that an error message "Invalid password." is displayed.
    ...    Ensure the user remains on the login page.
    Launch the browser
    Navigate to the login page URL
    Verify that the login page is displayed successfully
    Enter Username: practice
    Enter an incorrect Password (e.g., "WrongPassword")
    Click the Login button
    # Verify that an error message "Invalid password." is displayed    # Original step
    Verify that an error message "Your password is invalid!" is displayed    # Correct step - Contact Project Owner for the expected error message.
    Ensure the user remains on the login page
