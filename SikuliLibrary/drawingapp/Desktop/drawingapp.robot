*** Settings ***
Documentation     This test suite demonstrates testing a desktop application.
Suite Setup       Run Keywords    Run MyDrawingApp    Capture RoI    # Suite Teardown    Close MyDrawingApp
Library           SikuliLibrary
Resource          drawingapp.resource

*** Test Cases ***
Draw Robot Face
    Add Image Path    ${CURDIR}/../_images
    ${x}    ${y}=    Draw Line    300    450    500    450
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+30}}    ${{${y}-30}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}-200}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-30}}    ${{${y}-30}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-200}}    ${y}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-30}}    ${{${y}+30}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}+200}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+30}}    ${{${y}+30}}
    ${x}    ${y}=    Draw Line    300    445    498    445
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+28}}    ${{${y}-28}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}-198}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-28}}    ${{${y}-28}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-198}}    ${${y}+2}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}-28}}    ${{${y}+28}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${${x}+2}    ${{${y}+198}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+28}}    ${{${y}+28}}
    #
    ${x}    ${y}=    Draw Line    330    350    480    350
    ${x}    ${y}=    Draw Line    330    355    480    355
    #
    ${x}    ${y}=    Draw Line    430    305    480    255
    ${x}    ${y}=    Draw Line    428    305    478    255
    # left
    ${x}    ${y}=    Draw Line    330    305    330    290
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}-5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}-10}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+10}}    ${{${y}-5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+20}}    ${y}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+10}}    ${{${y}+5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}+10}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${{${x}+5}}    ${{${y}+5}}
    ${x}    ${y}=    Draw Line    ${x}    ${y}    ${x}    ${{${y}+15}}
    ${x}    ${y}=    Draw Line    332    305    332    290
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

*** Keywords ***
Draw Line
    [Arguments]    ${x0}    ${y0}    ${xl}    ${yl}
    Mouse Move Location    ${x0}    ${y0}
    Mouse Down    LEFT
    Mouse Move Location    ${xl}    ${yl}
    Mouse Up    LEFT
    RETURN    ${xl}    ${yl}
