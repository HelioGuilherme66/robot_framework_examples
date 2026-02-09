*** Settings ***
Library           SikuliLibrary
Library           Process

*** Variables ***
${OS_LINUX}       ${True}    # The host running Robot Framework
${IMAGE_DIR}      ${CURDIR}/../_images
${RDP_PROCESS}    ${None}
${USER_PASSWORD}    vagrant
@{SCREEN_W_H}     1024    768
${port_to_host_under_test}    5389
${host_under_test}    192.168.4.93
${remote_icon}    remmina_icon.png    # On windows you should have windows_rdp_icon.png

*** Keywords ***
Run RDP
    Add Image Path    ${IMAGE_DIR}
    IF    ${OS_LINUX}
        ${RDP_PROCESS}=    Start Process    ${CURDIR}/rdp.sh    ${port_to_host_under_test}
    ELSE
        ${RDP_PROCESS}=    Start Process    mstsc    /v:${host_under_test}:${port_to_host_under_test}    -w:${SCREEN_W_H[0]}    -h:${SCREEN_W_H[1]}    alias=RDP
    END
    Set Global Variable    ${RDP_PROCESS}
    Sleep    10 seconds    # For now hard coded delay
    Set Min Similarity    0.80
    Wait Until Screen Contain    ${remote_icon}    10
    Click    ${remote_icon}
        SikuliLibrary.Click    ${remote_icon}
    @{rdp_coords}=    Get Image Coordinates    ${remote_icon}
    IF    ${OS_LINUX}
        @{rdp_coords}=    Evaluate    [${rdp_coords[0]}-16, ${rdp_coords[1]}-5, ${SCREEN_W_H[0]}+20, ${SCREEN_W_H[1]}+${rdp_coords[3]}+20]
    ELSE
        @{rdp_coords}=    Evaluate    [${rdp_coords[0]}-2, ${rdp_coords[1]}+20, ${SCREEN_W_H[0]}, ${SCREEN_W_H[1]}+10]
    END
    Sleep    0.2 seconds
    SikuliLibrary.Click    ${remote_icon}    xOffset=200    yOffset=100
    Sleep    0.2 seconds
    Set RoI    ${rdp_coords}
    Set Global Variable    \${rdp_coords}
    ${result}=    Exists    windows_menu.png    5
    IF    ${result}
        RETURN
    END
    VAR    ${password_prompt}    ${False}
    VAR    ${counter}    0
    WHILE    not ${password_prompt} and ${counter} < 10
        ${password_prompt}=    Exists    login_passwd.png    5
        IF    ${password_prompt}
            Click    login_passwd.png
            Sleep    0.6 seconds
            RETURN
        END
        ${counter}=    Evaluate    ${counter} + 1
        Sleep    5 seconds
        Press Special Key    ENTER
        Sleep    0.6 seconds
    END

Login
    ${result}=    Exists    windows_menu.png    5
    IF    ${result}
        RETURN
    END
    ${result}=    Exists    login_passwd.png    5
    IF    ${result}
        Send Password
        Wait Until Screen Contain    windows_menu.png    60
    END

Send Password
    ${my_log_level}=    Set Log Level    NONE
    Type With Modifiers    ${USER_PASSWORD}
    Sleep    1 second
    Set Log Level    ${my_log_level}
    Press Special Key    ENTER

Close RDP
    IF    ${OS_LINUX}
        Run Process    killall    remmina
    END
    IF    ${RDP_PROCESS}
        Terminate Process    ${RDP_PROCESS}    kill=True
    END

Open Search Box
    Add Image Path    ${IMAGE_DIR}
    Set Min Similarity    0.80
    Wait Until Screen Contain    windows_menu.png    10
    ${result}=    Exists    windows_search_white.png    5
    IF    ${result}
        SikuliLibrary.Click    windows_search_white.png
    END
    Sleep    3 seconds
    Set Min Similarity    0.80

Windows Search
    [Arguments]    ${search_key}
    Press Special Key    ESC
    Open Search Box
    Sleep    2 seconds
    Type With Modifiers    ${search_key}
    Sleep    0.8 seconds
    Press Special Key    ENTER
    Sleep    2 seconds

Click Yes
    ${result}=    Exists    yes.png    5
    ${result3}=    Exists    yes3.png    5
    IF    ${result}
        SikuliLibrary.Click    yes.png
        Return From Keyword
    END
    IF    ${result3}
        SikuliLibrary.Click    yes3.png
        Return From Keyword
    END

Explorer Search
    [Arguments]    ${windows_path}
    Windows Search    ${windows_path.replace('/','\\')}
