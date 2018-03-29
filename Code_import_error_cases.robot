*** Settings ***
Documentation     Test Suite for Code import error cases
Suite Teardown    Close All Browsers
Library           Selenium2Library

*** Variables ***
${USER_1}         Testi Admin
${CODE_LIST_7}    testiautomaatiokoodisto1
${CODE_LIST_STATUS_DRAFT_FI}    Luonnos
#Buttons and links
${FILE_FORMAT_Excel}    //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[2]/div/div/div[1]/dl/dd/div/button[2]
${FILE_FORMAT_CSV}    //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[2]/div/div/div[1]/dl/dd/div/button[1]
${IMPORT_CODES_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-codes/div/div[2]/div/button[1]
${FILE_FORMAT_BTN}    //*[@id="format-dropdown"]
${FILE_UPLOAD_BTN}    //*[@id="fileupload"]
${IMPORT_BTN}     //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[3]/div/button[1]
${CLOSE_ERROR_MESSAGE_BTN}    //ngb-modal-window[2]/div/div/app-error-modal/div[3]/button
${CANCEL_IMPORT_CODE_LIST_BTN}    //ngb-modal-window/div/div/app-code-scheme-codes-import-modal/div/div[3]/div/button[2]
#Excel paths
${DATAFOLDER}     ${CURDIR}${/}test_files
${Codes_codevalue_missing}    ${DATAFOLDER}${/}Codes_codevalue_missing.xlsx
${Codes_status_missing}    ${DATAFOLDER}${/}Codes_status_missing.xlsx
${Codes_with_invalid_status}    ${DATAFOLDER}${/}Codes_with_invalid_status.xlsx
${Codes_with_invalid_broader}    ${DATAFOLDER}${/}Codes_with_invalid_broader_value.xlsx
${Codes_with_same_broader}    ${DATAFOLDER}${/}Codes_with_same_broader_value.xlsx
${Codes_with_duplicate_columns}    ${DATAFOLDER}${/}Codes_with_duplicate_columns.xlsx
${Codes_with_invalid_HL}    ${DATAFOLDER}${/}Codes_with_invalid_HL_value.xlsx
${Codes_without_codevalue_column}    ${DATAFOLDER}${/}Codes_without_codevalue_column.xlsx
${Codes_with_invalid_startdate}    ${DATAFOLDER}${/}Codes_with_invalid_startdate.xlsx
${Codes_with_invalid_ID}    ${DATAFOLDER}${/}Codes_with_invalid_ID.xlsx
${Update_Code_valid_draft}    ${DATAFOLDER}${/}Update_code_valid_draft.xlsx
${Duplicate_Codes}    ${DATAFOLDER}${/}Duplicate_codes.xlsx
${Codes_without_ID_column}    ${DATAFOLDER}${/}Codes_without_ID_column.xlsx
#CSV paths
${Codes_codevalue_missing_csv}    ${DATAFOLDER}${/}Codes_codevalue_missing_csv.csv
${Codes_status_missing_csv}    ${DATAFOLDER}${/}Codes_status_missing_csv.csv
${Codes_with_invalid_status_csv}    ${DATAFOLDER}${/}Codes_with_invalid_status_csv.csv
${Codes_with_invalid_broader_csv}    ${DATAFOLDER}${/}Codes_with_invalid_broader_value_csv.csv
${Codes_with_same_broader_csv}    ${DATAFOLDER}${/}Codes_with_same_broader_value_csv.csv
${Codes_with_duplicate_columns_csv}    ${DATAFOLDER}${/}Codes_with_duplicate_columns_csv.csv
${Codes_with_invalid_HL_csv}    ${DATAFOLDER}${/}Codes_with_invalid_HL_value_csv.csv
${Codes_without_codevalue_column_csv}    ${DATAFOLDER}${/}Codes_without_codevalue_column_csv.csv
${Codes_with_invalid_startdate_csv}    ${DATAFOLDER}${/}Codes_with_invalid_startdate_csv.csv
${Codes_with_invalid_ID_csv}    ${DATAFOLDER}${/}Codes_with_invalid_ID_csv.csv
${Update_Code_valid_draft_csv}    ${DATAFOLDER}${/}Update_code_valid_draft_csv.csv
${Duplicate_Codes_csv}    ${DATAFOLDER}${/}Duplicate_codes_csv.csv
#Error messages
${Error_no_codeValue}    Aineistossa puuttuu arvo sarakkeesta CODEVALUE riviltä 5.
${Error_no_status_value}    Aineistossa puuttuu arvo sarakkeesta STATUS riviltä 7.
${Error_with_invalid_status}    Aineistossa oleva STATUS-sarakkeen arvo ei ole sallittu.
${Error_with_invalid_broader}    Aineistossa olevaa BROADER-sarakkeen koodia ei löydy.
${Error_with_same_broader}    BROADER-sarakkeen arvo viittaa koodiin itseensä.
${Error_with_duplicate_columns}    Aineistosta löytyi sama sarake useita kertoja.
${Error_with_invalid_HL_value}    HIERARCHYLEVEL-sarakkeen arvo ei ole sallittu.
${Error_with_codevalue_column_missing}    Aineistosta puuttuu sarake otsikolla CODEVALUE.
${Error_with_invalid_startdate}    Virheellinen alkupäivä rivillä 5.
${Error_with_invalid_ID}    Aineistossa oleva ID-sarakkeen arvo ei ole sallittu.
${Error_with_update_code_valid_draft}    Aineiston tilan muutos ei ole sallittu.
${Error_with_duplicate_codes}    Aineistosta löytyi useita rivejä samalla CODEVALUE-arvolla.

*** Test Cases ***
400. Import Codes with missing CODEVALUE
    [Documentation]    Import Codes (Excel, CSV) with missing code value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_codevalue_missing}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_codeValue}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_codevalue_missing_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_codeValue}    timeout=10
    Cancel code import
    Sleep    1
    Go back to Koodistot frontpage

401. Import Codes with missing STATUS value
    [Documentation]    Import Codes (Excel, CSV) with missing STATUS value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_status_missing}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_status_value}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_status_missing_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_no_status_value}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

402. Import Codes with invalid STATUS value
    [Documentation]    Import Codes (Excel, CSV) with invalid STATUS value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_status}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_status}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_status_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_status}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

403. Import Codes with invalid BROADER value
    [Documentation]    Import Codes (Excel, CSV) with invalid BROADER value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_broader}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_broader}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_broader_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_broader}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

404. Code import when BROADER code references code value of the code itself
    [Documentation]    Import Codes (Excel, CSV) when BROADER code references code value of the code itself and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_same_broader}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_same_broader}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_same_broader_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_same_broader}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

405. Import codes with duplicate comlumns
    [Documentation]    Import Codes (Excel, CSV) with duplicate columns and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_duplicate_columns}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_duplicate_columns}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_duplicate_columns_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_duplicate_columns}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

406. Import codes with invalid HIERARCHYLEVEL value
    [Documentation]    Import Codes (Excel, CSV) with invalid HIERARCHYLEVEL value and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_HL}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_HL_value}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_HL_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_HL_value}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

407. Import codes with CODEVALUE column missing
    [Documentation]    Import codes (Excel, CSV) with CODEVALUE column missing and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_without_codevalue_column}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_codevalue_column_missing}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_without_codevalue_column_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_codevalue_column_missing}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

408. Import codes with invalid start date
    [Documentation]    Import codes (CSV, Excel) with invalid start date and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_startdate}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_startdate}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_startdate_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_startdate}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

409. Import codes with invalid ID values
    [Documentation]    Import codes (Excel, CSV) with invalid ID values and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_ID}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_ID}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Codes_with_invalid_ID_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_invalid_ID}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

410. Update code status from VALID to DRAFT
    [Documentation]    Update Code status from VALID to DRAFT with import function (Excel, CSV) and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Update_Code_valid_draft}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_update_code_valid_draft}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Update_Code_valid_draft_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_update_code_valid_draft}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

411. Import codes with duplicate CODEVALUES
    [Documentation]    Import codes (Excel, CSV) with duplicate CODEVALUES and check error message
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Select draft code list
    Import codes in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Duplicate_Codes}
    Sleep    2
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_duplicate_codes}    timeout=10
    Import codes in CSV format
    Choose file    ${FILE_UPLOAD_BTN}    ${Duplicate_Codes_csv}
    Sleep    1
    Wait until page contains element    ${IMPORT_BTN}    timeout=10
    Click button    Tuo
    Wait until page contains    ${Error_with_duplicate_codes}    timeout=10
    Cancel code import
    Sleep    2
    Go back to Koodistot frontpage

*** Keywords ***
Test Case Setup
    Open Koodistot
    Choose user

Open Koodistot
    Open Koodistot in 'chrome'
    Sleep    1

Choose user
    Wait until page contains element    //*[@class="nav-link dropdown-toggle"]    timeout=30
    Click element    //*[@class="nav-link dropdown-toggle"]
    Sleep    1
    Click element    //*[contains(text(), "${USER_1}")]
    Wait Until Page Contains    ${USER_1}
    Reload Page
    Sleep    2

Open Koodistot in '${BROWSER}'
    Open koodistot in dev-environment    ${BROWSER}
    Sleep    2
    Page should contain    Koodistot
    #Page should contain    Luokitus
    Page should contain    KIRJAUDU SISÄÄN

Open koodistot in dev-environment
    [Arguments]    ${browser}
    Set Selenium Speed    0.3
    Open Browser    https://koodistot-dev.suomi.fi/    browser=${browser}

Go back to Koodistot frontpage
    Wait until page contains element    //app-root/app-navigation-bar/nav/a/span    timeout=10
    Click element    //app-root/app-navigation-bar/nav/a/span
    Sleep    2
    Close All Browsers

Select draft code list
    Wait until page contains element    css=app-filter-dropdown.d-inline-block:nth-child(3)    timeout=30
    Click element    css=app-filter-dropdown.d-inline-block:nth-child(3)
    Click element    //*[contains(text(), "${CODE_LIST_STATUS_DRAFT_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_7}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_7}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_7}

Import codes in Excel format
    Wait until page contains element    ${IMPORT_CODES_BTN}    timeout=10
    Click element    ${IMPORT_CODES_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=10
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=10
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=10

Cancel code import
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_IMPORT_CODE_LIST_BTN}    timeout=10
    Click button    ${CANCEL_IMPORT_CODE_LIST_BTN}

Import codes in CSV format
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=10
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_CSV}    timeout=10
    Click element    ${FILE_FORMAT_CSV}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=10