*** Settings ***
Documentation     demo for appium library
Force Tags        demo
Library           AppiumLibrary

*** Test Cases ***
test_demo_web_page
    [Tags]    swipe
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=12    deviceName=emulator-5554    browserName=Chrome    automationName=UIAutomator2    chromedriverExecutable=/home/helio2/chromedriver
    Go To Url    https://drawisland.com/
    # Start Screen Recording
    Sleep    5s
    Wait Until Page Contains Element    xpath=/html/body/div[6]/div[2]/div[2]/div[2]/div[2]/button[1]/p    timeout=20    # //android.widget.Button[@text="Consent"]    timeout=20
    Click Element    xpath=/html/body/div[6]/div[2]/div[2]/div[2]/div[2]/button[1]/p
    Sleep    30s
    Tap    xpath=/html/body
    @{path}=    Create List    100    100    300    100    150    300    100    100
    Swipe Path    200    ${path}
    Sleep    10s
    # Stop Screen Recording

test_demo_mydrawapp
    [Tags]    swipe
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=12    deviceName=emulator-5554    automationName=UIAutomator2    appPackage=com.transformidea.mydrawingapp    app=/home/helio2/beeware/mydrawingapp/build/mydrawingapp/android/gradle/app/build/outputs/apk/debug/app-debug.apk
    Start Screen Recording
    Sleep    5s
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="My Drawing App"]    timeout=20
    Sleep    10s
    Tap    xpath=//android.widget.TextView[@text="My Drawing App"]
    @{path}=    Create List    100    100    300    100    150    300    100    100
    Swipe Path    200    ${path}
    Sleep    10s
    Stop Screen Recording
