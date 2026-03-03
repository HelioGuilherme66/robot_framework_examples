*** Settings ***
Documentation     In this scenario we are running scrcpy to connect to an Android smartphone.
...
...               Scrcpy was installed from https://github.com/Genymobile/scrcpy
...
...               The smartphone is connected via USB and has USB Debugging active.
Suite Setup       Run Keywords    Run ScrCpy    Run MyDrawingApp    Capture RoI
Suite Teardown    Run Keywords    Close ScrCpy
Library           SikuliLibrary
Resource          drawingapp_scrcpy.resource

*** Test Cases ***
Draw Robot Face
    Add Image Path    ${CURDIR}/../_images
    ${initial_coords}=    Evaluate    [${${scr_coords[0]}+80}, ${${scr_coords[1]}+550}]
    ${x}    ${y}=    Draw Line    ${initial_coords[0]}    ${initial_coords[1]}
    ...    ${${initial_coords[0]}+200}    ${initial_coords[1]}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+30}}    ${{${y}-30}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}-200}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-30}}    ${{${y}-30}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-200}}    ${y}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-30}}    ${{${y}+30}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}+200}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+30}}    ${{${y}+30}}
    ${x}    ${y}=    Draw Line    ${initial_coords[0]}    ${${initial_coords[1]}-5}
    ...    ${${initial_coords[0]}+198}    ${${initial_coords[1]}-5}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+28}}    ${{${y}-28}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}-198}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-28}}    ${{${y}-28}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-198}}    ${${y}+2}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-28}}    ${{${y}+28}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${${x}+2}    ${{${y}+198}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+28}}    ${{${y}+28}}
    #
    ${x}    ${y}=    Draw Line    ${${initial_coords[0]}+30}    ${${initial_coords[1]}-100}
    ...    ${${initial_coords[0]}+180}    ${${initial_coords[1]}-100}
    ${x}    ${y}=    Draw Line    ${${initial_coords[0]}+30}    ${${initial_coords[1]}-95}
    ...    ${${initial_coords[0]}+180}    ${${initial_coords[1]}-95}
    #
    ${x}    ${y}=    Draw Line    ${${initial_coords[0]}+130}    ${${initial_coords[1]}-145}
    ...    ${${initial_coords[0]}+180}    ${${initial_coords[1]}-195}
    ${x}    ${y}=    Draw Line    ${${initial_coords[0]}+128}    ${${initial_coords[1]}-145}
    ...    ${${initial_coords[0]}+178}    ${${initial_coords[1]}-195}
    # left
    ${x}    ${y}=    Draw Line    ${${initial_coords[0]}+30}    ${${initial_coords[1]}-145}
    ...    ${${initial_coords[0]}+30}    ${${initial_coords[1]}-160}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}-5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}-10}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+10}}    ${{${y}-5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+20}}    ${y}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+10}}    ${{${y}+5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}+10}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}+5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}+15}}
    ${x}    ${y}=    Draw Line    ${${initial_coords[0]}+32}    ${${initial_coords[1]}-145}
    ...    ${${initial_coords[0]}+32}    ${${initial_coords[1]}-160}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}-5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}-10}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+10}}    ${{${y}-5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+20}}    ${y}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+10}}    ${{${y}+5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}+10}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}+5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}+15}}
    Sleep    2 seconds
    Capture RoI
    Close MyDrawingApp

*** Keywords ***
Draw Line
    [Arguments]    ${x0}    ${y0}    ${xl}    ${yl}
    Mouse Move Location    ${x0}    ${y0}
    Mouse Down    LEFT
    Mouse Move Location    ${xl}    ${yl}
    Mouse Up    LEFT
    RETURN    ${xl}    ${yl}
