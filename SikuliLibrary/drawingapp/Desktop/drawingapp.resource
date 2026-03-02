*** Settings ***
Library           SikuliLibrary
Library           Process

*** Variables ***
${OS_LINUX}       ${True}    # The host running Robot Framework
${IMAGE_DIR}      ${CURDIR}/../_images
${APP_PROCESS}    ${None}
@{SCREEN_W_H}     645    510    # Dimensions of MyDrawingApp window
${app_icon}       app_icon.png

*** Keywords ***
Run MyDrawingApp
    Add Image Path    ${IMAGE_DIR}
    IF    ${OS_LINUX}
        ${APP_PROCESS}=    Start Process    /usr/bin/mydrawingapp
    ELSE
        ${APP_PROCESS}=    Start Process    mydrawingapp
    END
    Set Global Variable    ${APP_PROCESS}
    # Sleep    10 seconds    # For now hard coded delay
    Set Min Similarity    0.80
    Wait Until Screen Contain    ${app_icon}    10
    Click    ${app_icon}    xOffset=200
    @{rdp_coords}=    Get Image Coordinates    ${app_icon}
    IF    ${OS_LINUX}
        @{rdp_coords}=    Evaluate    [${rdp_coords[0]}-10, ${rdp_coords[1]}-5, ${SCREEN_W_H[0]}+5, ${SCREEN_W_H[1]}+${rdp_coords[3]}]
    ELSE
        @{rdp_coords}=    Evaluate    [${rdp_coords[0]}-2, ${rdp_coords[1]}+20, ${SCREEN_W_H[0]}, ${SCREEN_W_H[1]}+10]
    END
    Sleep    0.2 seconds
    Set RoI    ${rdp_coords}    timeout=2
    Set Global Variable    \${rdp_coords}

Close MyDrawingApp
    IF    ${OS_LINUX}
        Run Process    killall    mydrawingapp
    END
    IF    ${APP_PROCESS}
        Terminate Process    ${APP_PROCESS}    kill=True
    END
