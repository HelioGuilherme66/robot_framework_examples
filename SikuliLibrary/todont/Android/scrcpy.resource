*** Settings ***
Library           SikuliLibrary
Library           Process

*** Variables ***
${OS_LINUX}       ${True}    # The host running Robot Framework
${IMAGE_DIR}      ${CURDIR}/../_images
${RDP_PROCESS}    ${None}
${USER_PASSWORD}    vagrant
@{SCREEN_W_H}     334    762    # Dimensions of scrcpy window
${port_to_host_under_test}    5389
${host_under_test}    192.168.4.93
${remote_icon}    scrcpy_window_icon.png

*** Keywords ***
Run ScrCpy
    Add Image Path    ${IMAGE_DIR}
    IF    ${OS_LINUX}
        ${RDP_PROCESS}=    Start Process    /home/helio/Transferências/scrcpy-linux-x86_64-v3.3.4/scrcpy
    ELSE
        ${RDP_PROCESS}=    Start Process    scrcpy
    END
    Set Global Variable    ${RDP_PROCESS}
    Sleep    10 seconds    # For now hard coded delay
    Set Min Similarity    0.80
    Wait Until Screen Contain    ${remote_icon}    10
    Click    ${remote_icon}    xOffset=100
    @{rdp_coords}=    Get Image Coordinates    ${remote_icon}
    IF    ${OS_LINUX}
        @{rdp_coords}=    Evaluate    [${rdp_coords[0]}-16, ${rdp_coords[1]}-5, ${SCREEN_W_H[0]}+20, ${SCREEN_W_H[1]}+${rdp_coords[3]}+20]
    ELSE
        @{rdp_coords}=    Evaluate    [${rdp_coords[0]}-2, ${rdp_coords[1]}+20, ${SCREEN_W_H[0]}, ${SCREEN_W_H[1]}+10]
    END
    Sleep    0.2 seconds
    Click    ${remote_icon}    xOffset=200    yOffset=400
    Sleep    0.2 seconds
    Set RoI    ${rdp_coords}
    Set Global Variable    \${rdp_coords}

Close ScrCpy
    IF    ${OS_LINUX}
        Run Process    killall    scrcpy
    END
    IF    ${RDP_PROCESS}
        Terminate Process    ${RDP_PROCESS}    kill=True
    END

Start Browser
    [Arguments]    ${browser}
    Set Min Similarity    0.90
    IF    "${browser.lower()}" == "opera"
        VAR    ${search_icon}    scrcpy_google.png
    ELSE
        VAR    ${search_icon}    scrcpy_duckduckgo.png
    END
    VAR    ${browser}    scrcpy_${browser.lower()}.png
    ${result}=    Exists    ${browser}    5
    IF    ${result}
        Highlight    ${browser}    1
        Click    ${browser}
    END
    ${result}=    Exists    ${search_icon}    5
    IF    ${result}
        Highlight    ${search_icon}    1
        Click    ${search_icon}
    END
