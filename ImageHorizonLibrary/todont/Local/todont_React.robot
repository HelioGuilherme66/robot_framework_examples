*** Settings ***
Library           ImageHorizonLibrary

*** Variables ***
${BROWSER}        konqueror    # firefox | konqueror| google-chrome

*** Test Cases ***
Add new item
    Set Reference Folder    ${CURDIR}/../_images
    Set Confidence    0.6
    Launch Application    ${BROWSER}
    Sleep    6 seconds
    IF    "${BROWSER}" == "firefox"
        Press Combination    Key.CTRL    Key.N
        Sleep    2 seconds
    END
    Type    todont.zachmanson.com    Key.ENTER
    Sleep    5 seconds
    Wait For    add.png    timeout=15
    Click To The Left Of Image    add.png    offset=200    # Clicks the input box at left of button
    Type    New Task
    Sleep    2 seconds
    # Highlight    add.png    secs=2
    Click Image    add.png
    Sleep    2 seconds
    Take A Screenshot
