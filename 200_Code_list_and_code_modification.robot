*** Settings ***
Documentation     Test Suite for Code list and Code modification
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Extension_resources.robot

*** Test Cases ***
200. Modify DRAFT Code
    [Documentation]    Modify name, description and short name values for DRAFT code.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_NAME_INPUT}    timeout=20
    Input text    ${CODE_NAME_INPUT}    Tämä on uusi nimi koodille
    Wait until page contains element    ${CODE_DESC_INPUT}    timeout=20
    Input Text    ${CODE_DESC_INPUT}    Tämä on uusi kuvaus koodille
    Wait until page contains element    ${CODE_SHORT_NAME_INPUT}    timeout=20
    Input Text    ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    Tämä on uusi nimi koodille    timeout=20
    Wait until page contains    Tämä on uusi kuvaus koodille    timeout=20
    Wait until page contains    Tämä on uusi lyhyt nimi    timeout=20
    Sleep    1
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_4}

201. Add link to the DRAFT Code
    [Documentation]    Add link to the draft code, check link functionalty, check that it is not possible to add
    ...    same link url again and remove the link.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click element    ${ADD_LINK_DDL}
    Wait until page contains element    ${LINK_BTN}    timeout=20
    Click element    ${LINK_BTN}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click element    ${LINK_URL_INPUT}
    Sleep    1
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait Until Element Is Enabled    ${ADD_BTN}    timeout=20
    Click element    ${ADD_BTN}
    Sleep    1
    Wait until page contains    Liittyvä linkki    timeout=20
    Wait until page contains    https://www.suomi.fi/etusivu/    timeout=20
    Click element    //*[contains(text(), "https://www.suomi.fi/etusivu/")]
    Click element    id=external_ref_url_link
    Wait until page contains element    id=external_ref_url_link
    Click Element    id=external_ref_url_link
    Sleep    1
    Select Window    title=Etusivu - Suomi.fi
    Sleep    1
    Select Window    title=${ENVIRONMENT_TITLE_PREFIX}Koodistot
    Wait until page contains element    ${LINK_MODAL_OK_BTN}    timeout=20
    Click element    ${LINK_MODAL_OK_BTN}
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait Until Element Is Visible    ${MODIFY_CODE_BTN}    timeout=120
    Sleep    2
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click element    ${ADD_LINK_DDL}
    Sleep    1
    Wait until page contains element    ${LINK_BTN}    timeout=20
    Click element    ${LINK_BTN}
    Sleep    1
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click element    ${LINK_URL_INPUT}
    Sleep    1
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait until page contains    Linkki on jo käytössä tässä koodistossa.    timeout=20
    Wait until page contains element    ${CANCEL_CREATION_BTN}    timeout=20
    Click element    ${CANCEL_CREATION_BTN}
    Wait until page contains element    ${DELETE_LINK_ICON}    timeout=20
    Click element    ${DELETE_LINK_ICON}
    Sleep    1
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}    timeout=20
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Sleep    1
    Page should not contain    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait Until Element Is Visible    ${MODIFY_CODE_BTN}    timeout=120
    Sleep    1
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_4}

202. Add Creative Commons license to DRAFT Code
    [Documentation]    Add Creative Commons license to draft code and remove the license.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=30
    Click element    ${ADD_LINK_DDL}
    Wait until page contains element    ${LICENSE_BTN}    timeout=20
    Click element    ${LICENSE_BTN}
    Sleep    1
    Wait until page contains element    ${CCBY4.0}    timeout=20
    Click Element    ${CCBY4.0}
    Wait until page contains element    ${SELECT_LINK_BTN}    timeout=20
    Click Element    ${SELECT_LINK_BTN}
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    2
    Modify code
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=20
    Wait until page contains element    ${DELETE_LINK_ICON}    timeout=20
    Click element    ${DELETE_LINK_ICON}
    Sleep    1
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}    timeout=20
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Sleep    1
    Page should not contain    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    2
    [Teardown]    Remove code lists    ${CODE_LIST_4}

203. Modify link for DRAFT Code
    [Documentation]    Add link to the DRAFT code, modify link name, check the name from TIEDOT-tab
    ...    and remove the link. YTI-444, YTI-614.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Wait until page contains element    //*[contains(text(), "${CODE_1000}")]    timeout=20
    Click element    //*[contains(text(), "${CODE_1000}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_LINK_DDL}    timeout=20
    Click element    ${ADD_LINK_DDL}
    Wait until page contains element    ${LINK_BTN}    timeout=20
    Click element    ${LINK_BTN}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=20
    Click element    ${LINK_URL_INPUT}
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Wait Until Element Is Enabled    ${ADD_BTN}    timeout=20
    Click Element    ${ADD_BTN}
    Wait until page contains    Liittyvä linkki    timeout=20
    Save code modification
    Modify code
    Wait until page contains element    ${MODIFY_LINK_ICON}    timeout=20
    Click element    ${MODIFY_LINK_ICON}
    Wait until page contains element    ${LINK_NAME_INPUT}    timeout=20
    Click element    ${LINK_NAME_INPUT}
    Input Text    ${LINK_NAME_INPUT}    www.suomi.fi
    Wait until page contains element    ${SAVE_LINK_MODIFY_BTN}    timeout=20
    Click Element    ${SAVE_LINK_MODIFY_BTN}
    Wait until page contains    Liittyvä linkki
    Page should contain    www.suomi.fi
    Save code modification
    Reload Page
    [Teardown]    Remove code lists    ${CODE_LIST_2}

204. Set start date and end date for Code
    [Documentation]    Set validity start date and end date for DRAFT code and clear dates at the end.
    ...    YTI-438
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_START_DATE_BTN}    timeout=20
    Click element    ${CODE_START_DATE_BTN}
    Click element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(1)    timeout=20
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)    timeout=20
    Click element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(2)
    Wait until page contains element    ${CODE_END_DATE_BTN}    timeout=20
    Click element    ${CODE_END_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click element    css=select.custom-select:nth-child(1)
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(2)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)    timeout=20
    Click element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)
    Save code modification
    Wait Until Page Contains    02.01.2018 - 27.02.2018    timeout=20
    [Teardown]    Remove code lists    ${CODE_LIST_4}

205. Set end date before start date for Code list
    [Documentation]    Set end date before start date for code list and check error message.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_1}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_LIST_START_DATE_BTN}    timeout=20
    Click element    ${CODE_LIST_START_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(2)    timeout=20
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(2)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)    timeout=20
    Click element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)
    Wait until page contains element    ${CODE_LIST_END_DATE_BTN}    timeout=20
    Click element    ${CODE_LIST_END_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=20
    Click element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)    timeout=20
    Click element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)
    Save code list
    Wait until page contains    ${Error_end_date_before_start_date}    timeout=20
    Click element    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_CODE_MOD_BTN}    timeout=20
    Click element    ${CANCEL_CODE_MOD_BTN}
    [Teardown]    Remove code lists    ${CODE_LIST_4}

206. Change the status of VALID Code list
    [Documentation]    Change the status of VALID Code list and restore original status. YTI-445
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}
    Modify code list
    Wait until page contains element    ${CODE_LIST_STATUS_DDL}    timeout=20
    Click element    ${CODE_LIST_STATUS_DDL}
    Page should not contain    Luonnos
    Page should not contain    Odottaa hyväksyntää
    Click button    Korvattu
    Save code list
    Wait until page contains element    //*[contains(text(), "Korvattu")]    timeout=20
    Go back to Koodistot frontpage
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    [Teardown]    Remove code lists    ${CODE_LIST_6}

207. Modify Valid Code list
    [Documentation]    Change values for VALID Code list and restore original values. YTI-523
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto2_with_code}    ${CODE_LIST_6}
    Modify code list
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=20
    Input text    ${CODE_LIST_NAME_INPUT}    Testinimi
    Wait until page contains element    ${CODE_LIST_DESC_INPUT}    timeout=20
    Input text    ${CODE_LIST_DESC_INPUT}    Uusi kuvaus
    Wait until page contains element    ${CODE_LIST_DEF_INPUT}    timeout=20
    Input text    ${CODE_LIST_DEF_INPUT}    Uusi määritelmä
    Wait until page contains element    ${CODE_LIST_CHANGENOTE_INPUT}    timeout=20
    Input text    ${CODE_LIST_CHANGENOTE_INPUT}    Uusi muutostieto
    Save code list
    Wait until page contains    Testinimi    timeout=20
    Wait until page contains    Uusi kuvaus    timeout=20
    Wait until page contains    Uusi määritelmä    timeout=20
    Wait until page contains    Uusi muutostieto    timeout=20
    Wait until page contains    Oikeusturva    timeout=20
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    Testinimi

208. Modify classification for DRAFT Code list
    [Documentation]    Add classification for DRAFT Code list, check filtering according to the classification from frontpage,
    ...    remove classification.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto_with_code}    ${CODE_LIST_4}
    Modify code list
    Page should contain element    ${CLASSIFICATION_2}
    Wait until page contains element    ${ADD_CLASSIFICATION_BTN}    timeout=20
    Click element    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=20
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    Asuminen
    Click element    //*[contains(text(), "Asuminen")]
    Save code list
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=20
    Wait until page contains element    //*[contains(text(), "Koulutus")]    timeout=20
    Go back to Koodistot frontpage
    Wait until element is visible    ${STATUS_DROPDOWN_BTN}    timeout=60
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${ALL_STATUSES_FI}")]
    Wait until page contains element    //*[contains(text(), "Asuminen")]    timeout=60
    Click element    //*[contains(text(), "Asuminen")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=60
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_4}

209. Add broader code for code when code is not found from the system
    [Documentation]    Add broader code for code when broader code is not found from the system. Check error message. YTI-499.
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains element    //*[contains(text(), "Testcode 29")]    timeout=20
    Click element    //*[contains(text(), "Testcode 29")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${ADD_BROADER_CODE}    timeout=20
    Click element    ${ADD_BROADER_CODE}
    Wait until page contains element    //*[contains(text(), "Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "Testcode 28")]
    Open Koodistot
    Set Selenium Speed    ${SELENIUM_SPEED}
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    GO To    ${ENVIRONMENT_URL}/codescheme;registryCode=test;schemeCode=600
    Wait until page contains element    //*[contains(text(), "testcode28 - Testcode 28")]    timeout=20
    Click element    //*[contains(text(), "testcode28 - Testcode 28")]
    Select user    ${SUPER_USER_ID}    ${SUPER_USER_NAME}
    Wait until page contains element    ${CODE_DDL}    timeout=30
    Click element    ${CODE_DDL}
    Wait until page contains element    ${REMOVE_CODE_BTN}    timeout=20
    Click element    ${REMOVE_CODE_BTN}
    Wait until page contains element    ${CONFIRMATION_YES_BTN}    timeout=20
    Click element    ${CONFIRMATION_YES_BTN}
    Switch Browser    1
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    Koodia ei löydy.    timeout=20
    Wait until page contains element    ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20
    Click element    ${CLOSE_ERROR_MESSAGE_BTN}
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

210. Update code list values vith different languages
    [Documentation]    Import code list and update code list and code values vith different languages. YTI-674
    [Tags]    regression    test    200
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_codes_with_languages_empty}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=60
    Update code list    ${Code_list_codes_with_languages}    ${CODE_LIST_16}    ${FILE_FORMAT_Excel}
    Wait until page contains    30 koodia    timeout=60
    Wait until element is visible    //*[contains(text(), "testcode28 - Testcode 28_fi")]    timeout=60
    Click Element    //*[contains(text(), "testcode28 - Testcode 28_fi")]
    Wait until page contains    Koodisto600    timeout=60
    Wait until page contains    Testcode 28_fi    timeout=60
    Wait until page contains    Kuvaus_fi    timeout=60
    Wait until page contains    Määritelmä_fi    timeout=60
    Change content language    ${CONTENT_LANGUAGE_EN}
    Wait until page contains    Koodisto600_en    timeout=60
    Wait until page contains    Testcode 28_en    timeout=60
    Wait until page contains    Kuvaus_en    timeout=60
    Wait until page contains    Määritelmä_en    timeout=60
    Change content language    ${CONTENT_LANGUAGE_SW_UG}
    Wait until page contains    Koodisto600_sw    timeout=60
    Wait until page contains    Testcode 28_sw    timeout=60
    Wait until page contains    Kuvaus_sw    timeout=60
    Wait until page contains    Määritelmä_sw    timeout=60
    Wait until element is visible    ${2_BREADCRUMB_LINK}    timeout=60
    Click element    ${2_BREADCRUMB_LINK}
    Wait until element is visible    ${CODE_LIST_DDL}    timeout=60
    Wait until element is visible    ${CODELIST_INFO_TAB}    timeout=60
    Click element    ${CODELIST_INFO_TAB}
    Change content language    ${CONTENT_LANGUAGE_SV}
    Wait until page contains    Koodisto600_sv    timeout=60
    Wait until page contains    Kuvaus_sv    timeout=60
    Wait until page contains    Määritelmä_sv    timeout=60
    Wait until page contains    muutostieto_sv    timeout=60
    Import codes in Excel format
    Upload codes    ${Update_codes_with_languages}
    Wait until page contains element    ${CODELIST_CODES_TAB}    timeout=20
    Click element    ${CODELIST_CODES_TAB}
    Wait until page contains    30 koodia    timeout=60
    Wait until element is visible    //*[contains(text(), "testcode28 - Testcode 28_sv")]    timeout=60
    Click Element    //*[contains(text(), "testcode28 - Testcode 28_sv")]
    Change content language    ${CONTENT_LANGUAGE_AR_SO}
    Wait until page contains    Testcode 28_ar    timeout=60
    Wait until page contains    Kuvaus_ar    timeout=60
    Wait until page contains    Määritelmä_ar    timeout=60
    Go back to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}

*** Keywords ***
Go back to Koodistot frontpage
    Wait until page contains element    ${FRONTPAGE_LINK}    timeout=20
    Click element    ${FRONTPAGE_LINK}
    Sleep    2

Choose testiautomaatiokoodisto and edit
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=20
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${STATUS_DRAFT_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=20
    Click element    //*[contains(text(), "${CODE_LIST_4}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click element    //*[contains(text(), "TIEDOT")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "Muokkaa")]    timeout=20
    Click element    //*[contains(text(), "Muokkaa")]
    Sleep    1

Save code list
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_LIST_MOD_BTN}
    Wait Until Page Contains Element    ${MODIFY_CODE_LIST}    timeout=90

Modify code
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Sleep    1

Modify code list
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Sleep    2
