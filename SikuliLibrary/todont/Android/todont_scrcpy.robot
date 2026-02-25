*** Settings ***
Documentation     In this scenario we are running scrcpy to connect to an Android smartphone.
...
...               Scrcpy was installed from https://github.com/Genymobile/scrcpy
...
...               The smartphone is connected via USB and has USB Debugging active.
Suite Setup       Run Keywords    Run ScrCpy    Capture RoI
Suite Teardown    Close ScrCpy
Library           SikuliLibrary
Resource          scrcpy.resource

*** Variables ***
${BROWSER}        Chrome    # Opera or Chrome are the browsers installed on my phone

*** Test Cases ***
Add new item
    Add Image Path    ${CURDIR}/../_images
    Start Browser    ${BROWSER}
    Sleep    2 seconds
    IF    "${BROWSER}" == "firefox"
        Type With Modifiers    N    CTRL
        Sleep    2 seconds
    END
    Input Text    ${EMPTY}    todont.zachmanson.com
    Press Special Key    ENTER
    Sleep    5 seconds
    Wait Until Screen Contain    scrcpy_add.png    timeout=15
    Click    scrcpy_add.png    xOffset=-200    # Clicks the input box at left of button
    Sleep    1 second
    Input Text    ${EMPTY}    New Task
    Sleep    2 seconds
    Highlight    scrcpy_add.png    secs=2
    Click    scrcpy_add.png
    Sleep    2 seconds
    Capture RoI
