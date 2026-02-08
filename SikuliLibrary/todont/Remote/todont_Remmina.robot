*** Settings ***
Documentation     In this scenario we are running a virtual machine on Oracle VirtualBox.
...
...               We have started the vm with:
...
...               *"C:\\Program Files\\Oracle\\VirtualBox\\VBoxManage.exe" startvm -type headless "Windows11"*
Suite Setup       Run Keywords    Run RDP    Capture RoI    Login
Suite Teardown    Close RDP
Library           SikuliLibrary
Resource          remote.resource

*** Variables ***
${BROWSER}        msedge

*** Test Cases ***
Add new item
    Add Image Path    ${CURDIR}/../_images
    Windows Search    ${BROWSER}
    Sleep    6 seconds
    IF    "${BROWSER}" == "firefox"
        Type With Modifiers    N    CTRL
        Sleep    2 seconds
    END
    Input Text    ${EMPTY}    todont.zachmanson.com
    Press Special Key    ENTER
    Sleep    5 seconds
    Wait Until Screen Contain    add.png    timeout=15
    Click    add.png    xOffset=-200    # Clicks the input box at left of button
    Sleep    1 second
    Input Text    ${EMPTY}    New Task
    Sleep    2 seconds
    Highlight    add.png    secs=2
    Click    add.png
    Sleep    2 seconds
    Capture RoI
