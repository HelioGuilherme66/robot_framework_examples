*** Settings ***
Library           SikuliLibrary
Library           Process

*** Variables ***
${OS_LINUX}       ${True}    # The host running Robot Framework
${IMAGE_DIR}      ${CURDIR}/../_images
${SCRCPY_PROCESS}    ${None}
@{SCREEN_W_H}     446    1017    # Dimensions of scrcpy window taken from scrpy_my_phone.png
${remote_icon}    scrcpy_window_icon.png

*** Keywords ***
Run MyDrawingApp
    Add Image Path    ${IMAGE_DIR}
    Set Min Similarity    0.80
    VAR    ${app_icon}    scrcpy_my_drawing_app.png
    ${result}=    Exists    ${app_icon}    5
    IF    ${result}
        Highlight    ${app_icon}    1
        Click    ${app_icon}
        Wait Until Screen Contain    scrcpy_my_drawing_app_title.png    timeout=6
    END

Close MyDrawingApp
    ${result}=    Exists    scrcpy_my_drawing_app_selector.png    5
    IF    ${result}
        Click    scrcpy_my_drawing_app_selector.png
        Sleep    4 seconds
        # Click center of screen and drag up
        ${center}=    Evaluate    [${scr_coords[0]}+int(math.sqrt((${${scr_coords[2]}-${scr_coords[0]}})**2)/2), ${scr_coords[1]}+int(math.sqrt((${${scr_coords[3]}-${scr_coords[1]}})**2)/2)]
        Mouse Move Location    @{center}
        Mouse Down    LEFT
        Mouse Move Location    ${center[0]}    ${${center[1]}-300}
        Mouse Up    LEFT
        Sleep    4 seconds
        Mouse Move Location    @{center}
        Mouse Down    LEFT
        Mouse Up    LEFT
    END

Run ScrCpy
    Add Image Path    ${IMAGE_DIR}
    IF    ${OS_LINUX}
        ${SCRCPY_PROCESS}=    Start Process    /home/helio/Transferências/scrcpy-linux-x86_64-v3.3.4/scrcpy
    ELSE
        ${SCRCPY_PROCESS}=    Start Process    C:\\Selenium_Drivers\\start_scrcpy.cmd    # scrcpy
    END
    Set Global Variable    ${SCRCPY_PROCESS}
    Sleep    10 seconds    # For now hard coded delay
    Set Min Similarity    0.80
    Wait Until Screen Contain    ${remote_icon}    10
    Click    ${remote_icon}    xOffset=100
    @{scr_coords}=    Get Image Coordinates    ${remote_icon}
    IF    ${OS_LINUX}
        @{scr_coords}=    Evaluate    [${scr_coords[0]}-16, ${scr_coords[1]}-5, ${SCREEN_W_H[0]}+20, ${SCREEN_W_H[1]}+${scr_coords[3]}+20]
    ELSE
        @{scr_coords}=    Evaluate    [${scr_coords[0]}-2, ${scr_coords[1]}+20, ${SCREEN_W_H[0]}, ${SCREEN_W_H[1]}+10]
    END
    Sleep    0.2 seconds
    Click    ${remote_icon}    xOffset=200    yOffset=400
    Sleep    0.2 seconds
    Set RoI    ${scr_coords}    timeout=2
    Set Global Variable    \${scr_coords}

Close ScrCpy
    IF    ${OS_LINUX}
        Run Process    killall    scrcpy
    END
    IF    ${SCRCPY_PROCESS}
        Terminate Process    ${SCRCPY_PROCESS}    kill=True
    END
