*** Settings ***
Documentation     Test Suite for Code list and Code modification
Suite Teardown    Close All Browsers
Library           Selenium2Library

*** Variables ***
${USER_1}         Testi Admin
${CODE_LIST_4}    testiautomaatiokoodisto
${CODE_LIST_6}    testiautomaatiokoodisto 2
${TEST_CODE_1}    T100 - Automaatiokoodi
${CODE_LIST_STATUS_DRAFT_FI}    Luonnos
${CODE_LIST_STAUS_VALID_FI}    Voimassa oleva
${CODE_LIST_ALL_STATUSES_FI}    Kaikki tilat
${CLASSIFICATION_1}    Demokratia
${CLASSIFICATION_2}    Koulutus
#Buttons and links
${STATUS_DROPDOWN_BTN}    css=app-filter-dropdown.d-inline-block:nth-child(3)
${ADD_CLASSIFICATION_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-classifications-input/dl/dd/button
${CANCEL_CODE_MOD_BTN}    //button[@class='btn btn-link pull-right']
${MODIFY_CODE_BTN}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Muokkaa')]
${CODE_NAME_INPUT}    //*[@id="ngb-tab-2-panel"]/app-code-information/form/div[2]/div/app-localizable-input/dl/dd/div/input
${CODE_DESC_INPUT}    //*[@id="ngb-tab-2-panel"]/app-code-information/form/div[2]/div/app-localizable-textarea/dl/dd/div/textarea
${CODE_SHORT_NAME_INPUT}    //*[@id="ngb-tab-2-panel"]/app-code-information/form/div[2]/div/app-literal-input/dl/dd/div/input
${SAVE_CODE_MOD_BTN}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Tallenna')]
${ADD_LINK_TO_CODE_BTN}    //button[@class='btn btn-action']
${ADD_NEW_LINK_BTN}    //button[@class='btn btn-action'][contains(text(),'Lisää uusi linkki')]
${LINK_TYPE_DROPDOWN}    //button[@id='propertyType-dropdown']
${DROPDOWN_ITEM_LINK}    //button[@class='dropdown-item'][contains(text(),'Linkki')]
${LINK_URL_INPUT}    //ngb-modal-window[2]/div/div/app-link-create-modal/div[2]/div/div/form/app-literal-input/dl/dd/div/input
${ADD_BTN}        //div[@class='modal-footer']//div//button[@class='btn btn-action']
${LINK_1}         //a[@target='_blank'][contains(text(),'https://www.suomi.fi/etusivu/')]
${LINK_MODAL_OK_BTN}    //button[@class='btn btn-action'][contains(text(),'Ok')]
${DELETE_LINK_ICON}    //*[@class="icon icon-trash"]
${REMOVE_LINK_CONF_BTN}    //button[@class='btn btn-secondary-action confirm']
${CC_BY_40}       //ngb-modal-window/div/div/app-link-list-modal/div[2]/div/div/div[1]/div[2]/div/label/input
${SELECT_LINK_BTN}    //button[@class='btn btn-action'][contains(text(),'Valitse')]
${MODIFY_LINK_ICON}    //*[@class="icon icon-pencil"]
${LINK_NAME_INPUT}    //ngb-modal-window/div/div/app-link-edit-modal/div[2]/div/div/form/app-localizable-input/dl/dd/div/input
${SAVE_LINK_MODIFY_BTN}    //button[@class='btn btn-action'][contains(text(),'Tallenna')]
${CODE_START_DATE_BTN}    //app-root/div/app-code/div/ngb-tabset/div/div/app-code-information/form/div[2]/div/app-date-range-input/dl/dd/div/div/div[1]/app-date-input/dl/dd/div/div/button
${CODE_END_DATE_BTN}    //app-root/div/app-code/div/ngb-tabset/div/div/app-code-information/form/div[2]/div/app-date-range-input/dl/dd/div/div/div[2]/app-date-input/dl/dd/div/div/button
${CODE_START_DATE_INPUT}    //app-root/div/app-code/div/ngb-tabset/div/div/app-code-information/form/div[2]/div/app-date-range-input/dl/dd/div/div/div[1]/app-date-input/dl/dd/div/div/input
${CODE_END_DATE_INPUT}    //app-root/div/app-code/div/ngb-tabset/div/div/app-code-information/form/div[2]/div/app-date-range-input/dl/dd/div/div/div[2]/app-date-input/dl/dd/div/div/input
${SAVE_CODE_LIST_MOD_BTN}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Tallenna')]
${CANCEL_CODE_MOD_BTN}    //button[@class='btn btn-link pull-right']
${CLOSE_ERROR_MESSAGE_BTN}    //button[@class='btn btn-action'][contains(text(),'Sulje')]
${CODE_LIST_START_DATE_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-date-range-input/dl/dd/div/div/div[1]/app-date-input/dl/dd/div/div/button
${CODE_LIST_END_DATE_BTN}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-date-range-input/dl/dd/div/div/div[2]/app-date-input/dl/dd/div/div/button
${CODE_LIST_STATUS_DDL}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-status-input/dl/dd/app-status-dropdown/div/button
${CODE_LIST_NAME_INPUT}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-localizable-input/dl/dd/div/input
${CODE_LIST_DESC_INPUT}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-localizable-textarea[1]/dl/dd/div/textarea
${CODE_LIST_DEF_INPUT}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-localizable-textarea[2]/dl/dd/div/textarea
${CODE_LIST_CHANGENOTE_INPUT}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-localizable-textarea[3]/dl/dd/div/textarea
${MODIFY_CODE_LIST}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Muokkaa')]
${STATUS_VALID}    //button[@class='dropdown-item'][contains(text(),'Voimassa oleva')]
${STATUS_SUPERSEDED}    //button[@class='dropdown-item'][contains(text(),'Korvattu')]
${SAVE_CODE_LIST_MOD_BTN}    //button[@class='btn btn-action pull-right ml-3'][contains(text(),'Tallenna')]
${SEARCH_CLASSIFICATION_INPUT}    //ngb-modal-window/div/div/app-search-linked-code-modal/div[2]/div[1]/div/div/input
${NEW_CLASSIFICATION}    //app-root/div/app-code-scheme/div/ngb-tabset/div/div/app-code-scheme-information/form/div[2]/div/app-classifications-input/dl/dd/div/div[2]/a/i
#Error messages
${Error_end_date_before_start_date}    Loppupäivä ennen alkupäivää.

*** Test Cases ***
200. Modify DRAFT Code
    [Documentation]    Modify name, description and short name values for DRAFT code.
    [Tags]    regression
    [Setup]    Test Case Setup
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${CANCEL_CODE_MOD_BTN}
    Click element    ${CANCEL_CODE_MOD_BTN}
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_NAME_INPUT}    timeout=10
    Input text    ${CODE_NAME_INPUT}    Tämä on uusi nimi koodille
    Wait until page contains element    ${CODE_DESC_INPUT}    timeout=10
    Input Text    ${CODE_DESC_INPUT}    Tämä on uusi kuvaus koodille
    Wait until page contains element    ${CODE_SHORT_NAME_INPUT}    timeout=10
    Input Text    ${CODE_SHORT_NAME_INPUT}    Tämä on uusi lyhyt nimi
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    Tämä on uusi nimi koodille
    Wait until page contains    Tämä on uusi kuvaus koodille
    Wait until page contains    Tämä on uusi lyhyt nimi
    Sleep    1
    [Teardown]    Restore code modify

201. Add link to the DRAFT Code
    [Documentation]    Add link to the draft code, check link functionalty and remove the link.
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${ADD_LINK_TO_CODE_BTN}    timeout=30
    Click element    ${ADD_LINK_TO_CODE_BTN}
    Wait until page contains element    ${ADD_NEW_LINK_BTN}    timeout=10
    Click element    ${ADD_NEW_LINK_BTN}
    Wait until page contains element    ${LINK_TYPE_DROPDOWN}    timeout=10
    Click element    ${LINK_TYPE_DROPDOWN}
    Wait until page contains element    ${DROPDOWN_ITEM_LINK}    timeout=10
    Click element    ${DROPDOWN_ITEM_LINK}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=30
    Click element    ${LINK_URL_INPUT}
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Click Element    ${ADD_BTN}
    Wait until page contains    Linkki
    Page should contain    https://www.suomi.fi/etusivu/
    Click element    //*[contains(text(), "https://www.suomi.fi/etusivu/")]
    Wait until page contains element    ${LINK_1}    timeout=10
    Click element    ${LINK_1}
    Select Window    title=Etusivu - Suomi.fi
    Sleep    1
    Select Window    title=Koodistot
    Wait until page contains element    ${LINK_MODAL_OK_BTN}    timeout=10
    Click element    ${LINK_MODAL_OK_BTN}
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    2
    [Teardown]    Remove links from draft code

202. Add Creative Commons license to DRAFT Code
    [Documentation]    Add Creative Commons license to draft code and remove the license.
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${ADD_LINK_TO_CODE_BTN}    timeout=30
    Click element    ${ADD_LINK_TO_CODE_BTN}
    Wait until page contains element    ${CC_BY_40}    timeout=10
    Click element    ${CC_BY_40}
    Wait until page contains element    ${SELECT_LINK_BTN}    timeout=10
    Click element    ${SELECT_LINK_BTN}
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=10
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    2
    Modify code
    Wait until page contains    Lisenssi
    Wait until page contains    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)    timeout=10
    Wait until page contains element    ${DELETE_LINK_ICON}
    Click element    ${DELETE_LINK_ICON}
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Page should not contain    Creative Commons Nimeä 4.0 Kansainvälinen (CC BY 4.0)
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    2
    [Teardown]    Go back to Koodistot frontpage

203. Modify link for DRAFT Code
    [Documentation]    Add link to the DRAFT code, modify link name, check the name from TIEDOT-tab
    ...    and remove the link. YTI-444, YTI-614.
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${ADD_LINK_TO_CODE_BTN}    timeout=10
    Click element    ${ADD_LINK_TO_CODE_BTN}
    Wait until page contains element    ${ADD_NEW_LINK_BTN}    timeout=10
    Click element    ${ADD_NEW_LINK_BTN}
    Wait until page contains element    ${LINK_TYPE_DROPDOWN}    timeout=10
    Click element    ${LINK_TYPE_DROPDOWN}
    Wait until page contains element    ${DROPDOWN_ITEM_LINK}    timeout=10
    Click Element    ${DROPDOWN_ITEM_LINK}
    Wait until page contains element    ${LINK_URL_INPUT}    timeout=10
    Click element    ${LINK_URL_INPUT}
    Input Text    ${LINK_URL_INPUT}    https://www.suomi.fi/etusivu/
    Click Element    ${ADD_BTN}
    Wait until page contains    Linkki
    Save code modification
    Sleep    3
    Modify code
    Wait until page contains element    ${MODIFY_LINK_ICON}
    Click element    ${MODIFY_LINK_ICON}
    Sleep    1
    Wait until page contains element    ${LINK_NAME_INPUT}    timeout=10
    Click element    ${LINK_NAME_INPUT}
    Input Text    ${LINK_NAME_INPUT}    suomi.fi
    Wait until page contains element    ${SAVE_LINK_MODIFY_BTN}    timeout=10
    Click Element    ${SAVE_LINK_MODIFY_BTN}
    Wait until page contains    Linkki
    Page should contain    suomi.fi
    Save code modification
    Reload Page
    [Teardown]    Delete link from code

204. Set start date and end date for Code
    [Documentation]    Set validity start date and end date for DRAFT code and clear dates at the end.
    ...    YTI-438
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${CODE_START_DATE_BTN}    timeout=10
    Click element    ${CODE_START_DATE_BTN}
    Click element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)    timeout=10
    Click element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(2)
    Sleep    5
    Wait until page contains element    ${CODE_END_DATE_BTN}    timeout=10
    Click element    ${CODE_END_DATE_BTN}
    Sleep    1
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=10
    Click element    css=select.custom-select:nth-child(1)
    Sleep    1
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(2)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)    timeout=10
    Click element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(2)
    Sleep    1
    Save code modification
    Sleep    2
    Page should contain    02.01.2018 - 27.02.2018
    [Teardown]    Clear dates from code

205. Set end date before start date for Code list
    [Documentation]    Set end date before start date for code list and check error message.
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Choose testiautomaatiokoodisto and edit
    Wait until page contains element    ${CODE_LIST_START_DATE_BTN}    timeout=10
    Click element    ${CODE_LIST_START_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=10
    Click element    css=select.custom-select:nth-child(1)
    Sleep    1
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(2)    timeout=10
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(2)
    Wait until page contains element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)
    Click element    css=div.ngb-dp-week:nth-child(6) > div:nth-child(3)
    Sleep    2
    Wait until page contains element    ${CODE_LIST_END_DATE_BTN}    timeout=10
    Click element    ${CODE_LIST_END_DATE_BTN}
    Wait until page contains element    css=select.custom-select:nth-child(1)    timeout=10
    Click element    css=select.custom-select:nth-child(1)
    Wait until page contains element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Click element    css=select.custom-select:nth-child(1) > option:nth-child(1)
    Sleep    2
    Wait until page contains element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)    timeout=10
    Click element    css=div.ngb-dp-week:nth-child(2) > div:nth-child(1)
    Save code list
    Wait until page contains    ${Error_end_date_before_start_date}    timeout=10
    Click element    ${CLOSE_ERROR_MESSAGE_BTN}
    Wait until page contains element    ${CANCEL_CODE_MOD_BTN}    timeout=10
    Click element    ${CANCEL_CODE_MOD_BTN}
    [Teardown]    Go back to Koodistot frontpage

206. Change the status of VALID Code list
    [Documentation]    Change the status of VALID Code list and restore original status. YTI-445
    [Tags]    regression
    [Setup]    Test Case Setup
    Choose testiautomaatiokoodisto 2 and edit
    Wait until page contains element    ${CODE_LIST_STATUS_DDL}    timeout=10
    Click element    ${CODE_LIST_STATUS_DDL}
    Sleep    1
    Page should not contain    Luonnos
    Page should not contain    Odottaa hyväksyntää
    Click element    ${STATUS_SUPERSEDED}
    Save code list
    Wait until page contains element    //*[contains(text(), "Korvattu")]
    Sleep    1
    [Teardown]    Restore valid Code list status

207. Modify Valid Code list
    [Documentation]    Change values for VALID Code list and restore original values. YTI-523
    [Tags]    regression
    [Setup]    Test Case Setup
    Choose testiautomaatiokoodisto 2 and edit
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=10
    Input text    ${CODE_LIST_NAME_INPUT}    Testinimi
    Wait until page contains element    ${CODE_LIST_DESC_INPUT}    timeout=10
    Input text    ${CODE_LIST_DESC_INPUT}    Uusi kuvaus
    Wait until page contains element    ${CODE_LIST_DEF_INPUT}    timeout=10
    Input text    ${CODE_LIST_DEF_INPUT}    Uusi määritelmä
    Wait until page contains element    ${CODE_LIST_CHANGENOTE_INPUT}    timeout=10
    Input text    ${CODE_LIST_CHANGENOTE_INPUT}    Uusi muutostieto
    Save code list
    Sleep    1
    Page should contain    Testinimi
    Page should contain    Uusi kuvaus
    Page should contain    Uusi määritelmä
    Page should contain    Uusi muutostieto
    Page should contain    Oikeusturva
    [Teardown]    Restore valid Code list

208. Modify classification for DRAFT Code list
    [Documentation]    Add classification for DRAFT Code list, check filtering according to the classification from frontpage,
    ...    remove classification.
    [Tags]    regression
    [Setup]    Test Case Setup
    Set Selenium Speed    0.5
    Choose testiautomaatiokoodisto and edit
    Page should contain    ${CLASSIFICATION_2}
    Wait until page contains element    ${ADD_CLASSIFICATION_BTN}
    Click element    ${ADD_CLASSIFICATION_BTN}
    Wait until page contains element    ${SEARCH_CLASSIFICATION_INPUT}    timeout=10
    Input text    ${SEARCH_CLASSIFICATION_INPUT}    ${CLASSIFICATION_1}
    Click element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Sleep    1
    Save code list
    Page should contain    ${CLASSIFICATION_1}
    Page should contain    ${CLASSIFICATION_2}
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=10
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${CODE_LIST_ALL_STATUSES_FI}")]
    Wait until page contains element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Click element    //*[contains(text(), "${CLASSIFICATION_1}")]
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]
    Sleep    2
    [Teardown]    Remove classification from code list

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

Restore code modify
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=10
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_NAME_INPUT}    timeout=10
    Input text    ${CODE_NAME_INPUT}    Automaatiokoodi
    Wait until page contains element    ${CODE_DESC_INPUT}    timeout=10
    Input Text    ${CODE_DESC_INPUT}    Tämä on kuvaus koodille
    Wait until page contains element    ${CODE_SHORT_NAME_INPUT}    timeout=10
    Input Text    ${CODE_SHORT_NAME_INPUT}    Tämä on lyhyt nimi
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Wait until page contains    Automaatiokoodi
    Wait until page contains    Tämä on kuvaus koodille
    Wait until page contains    Tämä on lyhyt nimi
    Sleep    1
    Go back to Koodistot frontpage
    Close All Browsers

Go back to Koodistot frontpage
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=10
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    2
    Close All Browsers

Remove links from draft code
    Wait until page contains element    //*[contains(text(), "Etusivu")]    timeout=10
    Click element    //*[contains(text(), "Etusivu")]
    Sleep    1
    Choose testiautomaatiokoodisto code and edit
    Sleep    3
    Wait until page contains element    ${DELETE_LINK_ICON}
    Click element    ${DELETE_LINK_ICON}
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}    timeout=20
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Sleep    1
    Page should not contain    https://www.suomi.fi/etusivu/
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    1
    Go back to Koodistot frontpage
    Close All Browsers

Clear dates from code
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_START_DATE_INPUT}    timeout=10
    Clear element text    ${CODE_START_DATE_INPUT}
    Wait until page contains element    ${CODE_END_DATE_INPUT}    timeout=10
    Clear element text    ${CODE_END_DATE_INPUT}
    Click element    ${SAVE_CODE_MOD_BTN}
    Sleep    1
    Page should not contain    02.01.2018 - 27.02.2018
    Go back to Koodistot frontpage
    Close All Browsers

Choose testiautomaatiokoodisto code and edit
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${CODE_LIST_STATUS_DRAFT_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_4}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_4}
    Click element    //*[contains(text(), "${TEST_CODE_1}")]
    Wait until page contains    ${TEST_CODE_1}
    Sleep    1
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}

Choose testiautomaatiokoodisto and edit
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=10
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${CODE_LIST_STATUS_DRAFT_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_4}")]    timeout=10
    Click element    //*[contains(text(), "${CODE_LIST_4}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_4}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains element    //*[contains(text(), "Muokkaa")]    timeout=10
    Click element    //*[contains(text(), "Muokkaa")]

Choose testiautomaatiokoodisto 2 and edit
    Wait until page contains element    ${STATUS_DROPDOWN_BTN}    timeout=30
    Click element    ${STATUS_DROPDOWN_BTN}
    Click element    //*[contains(text(), "${CODE_LIST_STAUS_VALID_FI}")]
    Sleep    1
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_6}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_6}")]
    Sleep    1
    Wait until page contains    ${CODE_LIST_6}
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=10
    Click element    //*[contains(text(), "TIEDOT")]
    Wait until page contains element    //*[contains(text(), "Muokkaa")]    timeout=10
    Click element    //*[contains(text(), "Muokkaa")]

Restore valid Code list status
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=10
    Click element    ${MODIFY_CODE_LIST}
    Wait until page contains element    ${CODE_LIST_STATUS_DDL}    timeout=10
    Click element    ${CODE_LIST_STATUS_DDL}
    Click element    ${STATUS_VALID}
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}
    Click element    ${SAVE_CODE_LIST_MOD_BTN}
    Sleep    2
    Wait until page contains    Voimassa oleva
    Sleep    2
    Go back to Koodistot frontpage
    Close All Browsers

Restore valid Code list
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=10
    Click element    //*[contains(text(), "Muokkaa")]
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=10
    Input text    ${CODE_LIST_NAME_INPUT}    testiautomaatiokoodisto 2
    Wait until page contains element    ${CODE_LIST_DESC_INPUT}    timeout=10
    Input text    ${CODE_LIST_DESC_INPUT}    Tämä on kuvaus
    Wait until page contains element    ${CODE_LIST_DEF_INPUT}    timeout=10
    Input text    ${CODE_LIST_DEF_INPUT}    Tämä on määritelmä
    Wait until page contains element    ${CODE_LIST_CHANGENOTE_INPUT}    timeout=10
    Input text    ${CODE_LIST_CHANGENOTE_INPUT}    Muutostieto
    Click element    //*[contains(text(), "Tallenna")]
    Page should contain    testiautomaatiokoodisto 2
    Page should contain    Tämä on kuvaus
    Page should contain    Tämä on määritelmä
    Page should contain    Muutostieto
    Page should contain    Oikeusturva
    Sleep    2
    Go back to Koodistot frontpage
    Close All Browsers

Save code list
    Wait until page contains element    ${SAVE_CODE_LIST_MOD_BTN}    timeout=10
    Click element    ${SAVE_CODE_LIST_MOD_BTN}

Modify code
    Wait until page contains element    ${MODIFY_CODE_BTN}
    Click element    ${MODIFY_CODE_BTN}

Save code modification
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}
    Click element    ${SAVE_CODE_MOD_BTN}

Delete link from code
    Modify code
    Wait until page contains element    ${DELETE_LINK_ICON}
    Click element    ${DELETE_LINK_ICON}
    Wait until page contains element    ${REMOVE_LINK_CONF_BTN}
    Click Element    ${REMOVE_LINK_CONF_BTN}
    Page should not contain    suomi.fi
    Save code modification
    Sleep    2
    Go back to Koodistot frontpage

Remove classification from code list
    Set Selenium Speed    0.5
    Choose testiautomaatiokoodisto and edit
    Page should contain    ${CLASSIFICATION_1}
    Page should contain    ${CLASSIFICATION_2}
    Wait until page contains element    ${NEW_CLASSIFICATION}
    Click element    ${NEW_CLASSIFICATION}
    Save code list
    Sleep    3
    Page should not contain    ${CLASSIFICATION_1}
    Page should contain    ${CLASSIFICATION_2}
    Sleep    1
    Go back to Koodistot frontpage
    Close All Browsers