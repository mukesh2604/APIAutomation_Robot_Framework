*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseurl}=    https://reqres.in

*** Test Cases ***

Create_User
    Create Session    mysession    ${baseurl}
    ${body}=    Create Dictionary    name=morpheus    job=leader    id=177    createdAt=2024-07-13T14:37:08.843Z
    ${header}=    Create Dictionary    Content-Type=application/json

    ${response}=    POST On Session    mysession    /api/users    ${body}    ${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #validation
    ${id}=    Convert To String       ${response.content}  
    Should Contain    ${id}    id
    Should Contain    ${id}    name
    Should Contain    ${id}    job
    Should Contain    ${id}    createdAt
    ${status}=    Convert To String       ${response.status_code}
    Should Contain    ${id}    id    201




