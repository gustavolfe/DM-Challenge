*** Settings ***

Library  Collections
Library  RequestsLibrary
Library  SeleniumLibrary
Library  utils.py

*** Variables ***

${url}  http://challengeqa.staging.devmuch.io
${status_error_msg}  O status_code retornado pela requisicao nao é o esperado!!
${error_code}  400
${sucess_code}  200

*** Keywords ***

Input a valid value and an language
    [Arguments]  ${lang}  ${value}
    ${word}=  GET WORD FROM NUMBER  ${value}  ${lang}
    ${response}=  GET REQUEST FROM LANGUAGE  ${lang}  ${value}
    RUN KEYWORD AND CONTINUE ON FAILURE  STATUS SHOULD BE  ${sucess_code}  ${response}
    IF  '${lang}' == 'pt-br'
        SHOULD BE EQUAL AS STRINGS  {"extenso": "${word}"}  ${response.content}
    ELSE
        SHOULD BE EQUAL AS STRINGS  {"full": "${word}"}  ${response.content}
    END

Input a invalid value and an language
    [Arguments]  ${lang}  ${value}
    ${response}=  GET REQUEST FROM LANGUAGE  ${lang}  ${value}
    RUN KEYWORD AND CONTINUE ON FAILURE  STATUS SHOULD BE  ${error_code}  ${response}  ${status_error_msg}

Validate invalid random value with specific language
    [Arguments]  ${lang}
    ${value}=  GET INVALID RANDOM VALUE
    ${response}=  GET REQUEST FROM LANGUAGE  ${lang}  ${value}
    RUN KEYWORD AND CONTINUE ON FAILURE  STATUS SHOULD BE  ${error_code}  ${response}  ${status_error_msg}


Validate numbers to words with sucessful random value with specific language
    [Arguments]  ${lang}
    ${value}=  GET SUCESSFUL RANDOM VALUE
    ${word}=  GET WORD FROM NUMBER  ${value}  ${lang}
    ${response}=  GET REQUEST FROM LANGUAGE  ${lang}  ${value}
    RUN KEYWORD AND CONTINUE ON FAILURE  STATUS SHOULD BE  ${sucess_code}  ${response}
    IF  '${lang}' == 'pt-br'
        SHOULD BE EQUAL AS STRINGS  {"extenso": "${word}"}  ${response.content}
    ELSE
        SHOULD BE EQUAL AS STRINGS  {"full": "${word}"}  ${response.content}
    END

Get request from language
    [Arguments]  ${lang}  ${value}
    IF  '${lang}' == 'pt-br'
            ${request}=  GET  ${url}/${value}  expected_status=any
        ELSE
            ${request}=  GET  ${url}/${lang}/${value}  expected_status=any
    END
    [Return]  ${request}

