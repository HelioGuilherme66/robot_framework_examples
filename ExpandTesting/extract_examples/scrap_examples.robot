*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           OperatingSystem
Variables         ../main_variables.py

*** Tasks ***
Obtain Cards
    [Setup]    Open Browser    ${examples_url}    headlessfirefox
    Create File    ${CURDIR}/my_test_list.lst
    @{test_list}=    Create List
    ${elements}=    Get WebElements    ${section_examples}//div[@class="card-body"]//h3/a
    ${text}=    Get WebElements    ${section_examples}//div[@class="card-body"]//p[@class="card-text"]
    FOR    ${link}    ${content}    IN ZIP    ${elements}    ${text}
        ${anchor}=    Get Element Attribute    ${link}    href
        ${description}=    Get Text    ${content}
        &{row}=    Create Dictionary    anchor=${anchor}    content=${description}
        ${srow}=    Convert To String    ${row}
        Append To File    ${CURDIR}/my_test_list.lst    ${srow}\n
    END
    # Log Many    ${test_list}
    [Teardown]    Close All Browsers
