*** Settings ***
Library           SikuliLibrary

*** Variables ***
${BROWSER}        konqueror    # firefox | konqueror| google-chrome

*** Test Cases ***
Add new item
    Add Image Path    ${CURDIR}/../_images
    Open Application    ${BROWSER}
    Sleep    6 seconds
    IF    "${BROWSER}" == "firefox"
        Type With Modifiers    N    CTRL
        Sleep    2 seconds
    END
    Input Text    ${EMPTY}    todont.zachmanson.com
    Press Special Key    ENTER
    Sleep    5 seconds
    Wait Until Screen Contain    add.png    timeout=5
    Click    add.png    xOffset=-200    # Clicks the input box at left of button
    Input Text    ${EMPTY}    New Task
    Sleep    2 seconds
    Highlight    add.png    secs=2
    Click    add.png
    Sleep    2 seconds
    Capture Screen
