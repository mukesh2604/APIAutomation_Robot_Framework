#1) validation status code
#2) response  body
#3) header

*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseurl}    https://dummy.restapiexample.com
${headers}    {"Accept": "application/json", "User-Agent": "RobotFramework", "Content-Type": "application/json"}

*** Test Cases ***
Get Employee Details
    Create Session    mysession    ${baseurl}    headers=${headers}
    ${response}=    GET On Session    mysession    /api/v1/employees
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    log To console    ${headers}
    
     #validatioin
    ${statusCode} =    Convert To String        ${response.status_code}
    Should Be Equal    ${statusCode}    200
    
    ${content}=    Convert To String       ${response.content}
    Should Contain    ${content}    Tiger Nixon"
    
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    application/json
    Log To Console    Content-Type: ${contentTypeValue}
