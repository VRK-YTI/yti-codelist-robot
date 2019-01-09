*** Settings ***
Documentation     Test Suite for Extensions
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Library           SeleniumLibrary
Resource          resources/Generic_resources.robot
Resource          resources/Controlled_vocabularies_resources.robot
Resource          resources/Extension_resources.robot

*** Test Cases ***
600. Import code list with extension
    [Documentation]    Import Code list with extension and members (definition hierarchy), check that import is successfull,
    ...    modify member, export Excel and remove code list.
    [Tags]    koodistot    regression    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Codelist_Extensions_members}    ${CODE_LIST_14}
    Wait until page contains    testcode01 - Testikoodi 01    timeout=20
    Wait until page contains    testcode25 - Testikoodi 25    timeout=20
    Wait until page contains    25 koodia    timeout=20
    Wait until page contains element    //*[contains(text(), "${TEST_CODE_6}")]    timeout=20
    Click element    //*[contains(text(), "${TEST_CODE_6}")]
    Sleep    5
    Page should contain    Testikoodisto2 pitkillä arvoilla
    Page should contain    testcode25
    Page should contain    Testikoodi 25
    Page should contain    http://uri.suomi.fi/codelist/test/O1234567890123456789012345678901234567111/code/testcode25
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Sleep    2
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    //*[contains(@id,'222_view_extension')]    timeout=20
    Wait until page contains element    //*[contains(@id,'111_view_extension')]    timeout=20
    Click Element    //*[contains(@id,'111_view_extension')]
    Wait until page contains    9 jäsentä    timeout=20
    Wait until page contains element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Wait until page contains element    //*[contains(text(), " Jäsen1 · Testikoodi 01")]    timeout=20
    Sleep    2
    Click element    //*[contains(text(), " Jäsen1 · Testikoodi 01")]
    Sleep    2
    Wait until page contains    Testikoodisto2 pitkillä arvoilla    timeout=20
    Wait until page contains    Laajennus    timeout=20
    Wait until page contains    Testilaajennus11    timeout=20
    Wait until page contains    Koodi    timeout=20
    Wait until page contains    testcode01 - Testikoodi 01    timeout=20
    Sleep    2
    Wait until page contains element    ${MODIFY_MEMBER_BTN}    timeout=20
    Click element    ${MODIFY_MEMBER_BTN}
    Wait until page contains element    ${ADD_DEFAULTCODE_BTN}    timeout=20
    Click element    ${ADD_DEFAULTCODE_BTN}
    Wait until page contains element    ${SEARCH_DEFAULTCODE_INPUT}
    Input Text    ${SEARCH_DEFAULTCODE_INPUT}    25
    Click element    //*[contains(text(), "Testikoodi 25")]
    Wait until page contains element    ${ADD_MEMBER_BTN}    timeout=20
    Click element    ${ADD_MEMBER_BTN}
    Wait until page contains element    ${SEARCH_MEMBER_INPUT}    timeout=20
    Input Text    ${SEARCH_MEMBER_INPUT}    koulutus
    Click element    //*[contains(text(), "Koulutus, kulttuuri ja urheilu")]
    Wait until page contains element    ${SAVE_MEMBER}    timeout=20
    Click element    ${SAVE_MEMBER}
    Wait until page contains    Koodisto
    Wait until page contains    Testikoodisto2 pitkillä arvoilla
    Wait until page contains    Laajennus
    Wait until page contains    Testilaajennus11
    Wait until page contains    Koodi
    Wait until page contains    testcode25 - Testikoodi 25
    Wait until page contains    Laajennus
    Wait until page contains    Koulutus, kulttuuri ja urheilu
    Wait until page contains element    ${3_BREADCRUMB_LINK}    timeout=20
    Click element    ${3_BREADCRUMB_LINK}
    Sleep    3
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click element    ${2_BREADCRUMB_LINK}
    Sleep    3
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    5
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_14}

601. Import code list with codes and import extension and members
    [Documentation]    Import code list with codes and import extension and members.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Wait until page contains    30 koodia    timeout=20
    Upload extension    ${Extension_definition_hierarchy}    ${FILE_FORMAT_EXCEL}
    Wait until page contains element    //*[contains(@id,'555_view_extension')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extension')]
    Wait until page contains element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Upload members    ${Definition_hierarchy_members}    ${FILE_FORMAT_EXCEL}
    Wait until page contains element    //*[contains(text(), "Testcode 28")]
    Wait until page contains element    //*[contains(text(), "Testcode 29")]    timeout=20
    Click element    //*[contains(text(), "Testcode 28")]
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennus    timeout=20
    Wait until page contains    Testilaajennus55    timeout=20
    Wait until page contains    suomi    timeout=20
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains element    ${3_BREADCRUMB_LINK}    timeout=20
    Click element    ${3_BREADCRUMB_LINK}
    Sleep    2
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}

602. Import new code list and create extension and members
    [Documentation]    Import new code list and create calculation hierarchy extension and member manually
    [Tags]    koodistot    regression    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    DCAT-luokitus    False
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    600 - Koodisto600    Testcode 57    ${EMPTY}
    Wait until page contains    - Member 1 · Testcode 57 <=    timeout=20
    Wait until page contains element    //*[contains(@id,'3_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'3_breadcrumb_link')]
    Sleep    2
    Wait until page contains element    //*[contains(text(), "- Member 1 · Testcode 57 · Koodisto600 · Testirekisteri <=")]    timeout=20
    Wait until page contains    Extension 1    timeout=20
    Sleep    1
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}

603. Delete extension and member
    [Documentation]    Import new code list and create and delete calculation hierarchy extension and member.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${EMPTY}    False
    Sleep    2
    Capture Page Screenshot
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Testcode 57    ${EMPTY}
    Wait until page contains    Koodisto
    Wait until page contains    Koodisto600
    Wait until page contains    Laajennus
    Wait until page contains    Extension 1
    Wait until page contains    Jäsenen nimi
    Wait until page contains    Member 1
    Wait until page contains    Aritmeettinen operaattori    timeout=20
    Wait until page contains    -    timeout=20
    Wait until page contains    Vertailuoperaattori    timeout=20
    Wait until page contains    <=    timeout=20
    Wait until page contains    Koodi
    Wait until page contains    testcode57 - Testcode 57
    Delete member
    Wait until page contains    Extension 1    timeout=30
    Wait until page contains    Tällä laajennuksella ei ole yhtään jäsentä.    timeout=30
    Delete extension
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}

604. Modify extension member
    [Documentation]    Import new code list, import calculation hierarchy extension and members and modify member.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Upload extension    ${Extension_calculation_hierarchy}    ${FILE_FORMAT_EXCEL}
    Sleep    2
    Wait until page contains element    //*[contains(@id,'555_view_extension')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extension')]
    Wait until page contains element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Upload members    ${Calculation_hierarchy_members}    ${FILE_FORMAT_EXCEL}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "- Jäsen2 · Testcode 29 · Koodisto600 · Testirekisteri <=")]
    Wait until page contains element    //*[contains(text(), "- Jäsen1 · Testcode 28 · Koodisto600 · Testirekisteri <=")]    timeout=20
    Click element    //*[contains(text(), "- Jäsen1 · Testcode 28 <=")]
    Wait until page contains element    ${MODIFY_MEMBER_BTN}    timeout=20
    Click element    ${MODIFY_MEMBER_BTN}
    Sleep    2
    Wait until page contains element    ${ADD_MEMBER_BTN}    timeout=20
    Click element    ${ADD_MEMBER_BTN}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "Testcode 29")]    timeout=20
    Click element    //*[contains(text(), "Testcode 29")]
    Wait until page contains element    ${MEMBER_NAME_INPUT}    timeout=30
    Input Text    ${MEMBER_NAME_INPUT}    ${MEMBER_NAME_1}
    Wait until page contains element    ${ADD_CODE_TO_MEMBER_BTN}    timeout=30
    Click button    ${ADD_CODE_TO_MEMBER_BTN}
    Wait until page contains element    ${SEARCH_CODE_TO_MEMBER_INPUT}    timeout=30
    Input Text    ${SEARCH_CODE_TO_MEMBER_INPUT}    Testcode 57
    Wait until page contains element    //*[contains(text(), "Testcode 57")]    timeout=30
    Click element    //*[contains(text(), "Testcode 57")]
    Sleep    3
    Wait until page contains element    ${REMOVE_MEMBER_LINK}    timeout=20
    Click element    ${REMOVE_MEMBER_LINK}
    Wait until page contains element    ${SAVE_MEMBER}    timeout=20
    Click element    ${SAVE_MEMBER}
    Sleep    4
    Wait until page contains    Koodisto    timeout=20
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennus    timeout=20
    Wait until page contains    Testilaajennus55    timeout=20
    Wait until page contains    Jäsenen nimi    timeout=20
    Wait until page contains    Member 1    timeout=20
    Wait until page contains    Koodi    timeout=20
    Wait until page contains    testcode57 - Testcode 57
    Page should not contain    - Jäsen2 · Testcode 29 <=
    Log to Console    Member modified
    Sleep    2
    Wait until page contains element    //*[contains(@id,'3_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'3_breadcrumb_link')]
    Sleep    3
    Wait until page contains    Testilaajennus55    timeout=20
    Wait until page contains element    //*[contains(text(), "- Member 1 · Testcode 57 <=")]    timeout=20
    Page should not contain element    ${EXPAND_ALL_BTN}
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}

605. Import members in CSV format
    [Documentation]    Import code list with codes and import extension,
    ...    Import members in CSV format and export CSV.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Upload extension    ${Extension_calculation_hierarchy}    ${FILE_FORMAT_EXCEL}
    Wait until page contains element    //*[contains(@id,'555_view_extension')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extension')]
    Wait until page contains element    //*[contains(text(), "JÄSENET")]    timeout=20
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Upload members    ${Calculation_hierarchy_members_csv}    ${FILE_FORMAT_CSV}
    Wait until page contains element    //*[contains(text(), "- Jäsen2 · Testcode 29 · Koodisto600 · Testirekisteri <=")]    timeout=20
    Wait until page contains element    //*[contains(text(), "- Jäsen1 · Testcode 28 · Koodisto600 · Testirekisteri <=")]    timeout=20
    Click element    //*[contains(text(), "- Jäsen1 · Testcode 28 · Koodisto600 · Testirekisteri <=")]
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennus    timeout=20
    Wait until page contains    Testilaajennus55    timeout=20
    Wait until page contains    Jäsenen nimi    timeout=20
    Wait until page contains    Jäsen1    timeout=20
    Wait until page contains    Aritmeettinen operaattori    timeout=20
    Wait until page contains    -    timeout=20
    Wait until page contains    Vertailuoperaattori    timeout=20
    Wait until page contains    <=    timeout=20
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Sleep    2
    Wait until page contains element    ${3_BREADCRUMB_LINK}    timeout=20
    Click element    ${3_BREADCRUMB_LINK}
    Sleep    5
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_CSV}
    Sleep    5
    Log to Console    CSV exported
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}

606. Import code list with extension and without CODESCHEMES value
    [Documentation]    Import code list with extension. Check error message when CODESCHEME value
    ...    for external code list is missing from Extensions sheet in Excel. YTI-853
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Extensions_without_codeschemes_value}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Sleep    3
    Wait until page contains    ${Error_missing_codeschemes}    timeout=20
    Cancel code import
    Sleep    2
    Return to Koodistot frontpage

607. Import code list with extension and with invalid code
    [Documentation]    Import code list (Excel) with extension. Check error message when
    ...    code in extensions sheet is not included to the code list. YTI-853
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Extensions_invalid_code_in_members_sheet}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_invalid_code}    timeout=20
    Cancel code import
    Sleep    2
    Return to Koodistot frontpage

608. Import code list with extension and members that exceed maximum hierarchy level
    [Documentation]    Import code list with extension and members that exceed maximum hierarchy level and
    ...    Check error message . YTI-844
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Choose file    ${FILE_UPLOAD_BTN}    ${Extensios_max_hierarchy_level}
    Sleep    2
    Wait until page contains element    ${IMPORT_CODE_LIST_BTN}    timeout=20
    Click button    Tuo
    Wait until page contains    ${Error_max_hierarchy_level}    timeout=20
    Cancel code import
    Sleep    2
    Return to Koodistot frontpage

609. Import members with missing member value
    [Documentation]    Import members with missing unaryoperator value to calculation hierarchy extension
    ...    and check that import is successful.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Sleep    2
    Upload extension    ${Extension_calculation_hierarchy}    ${FILE_FORMAT_EXCEL}
    Wait until page contains element    //*[contains(@id,'555_view_extension')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extension')]
    Upload members    ${Unaryoperator_value_missing}    ${FILE_FORMAT_EXCEL}
    Sleep    5
    Wait until page contains    14 jäsentä    timeout=20
    Wait until page contains element    //*[contains(text(), "- Jäsen1 · Testcode 28 · Koodisto600 · Testirekisteri <=")]    timeout=20
    Sleep    2
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}

610. Add code list to the extension
    [Documentation]    Add code list to the calculation hierarchy extension and
    ...    add codes from that code list to the extension member.
    [Tags]    koodistot    regression    600
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Return to Koodistot frontpage
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Sleep    2
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_2}    False
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click Element    //*[contains(text(), "TIEDOT")]
    Wait until page contains    Koodisto    timeout=20
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennuksen tunnus    timeout=20
    Wait until page contains    extension1    timeout=20
    Wait until page contains    Laajennuksen nimi    timeout=20
    Wait until page contains    Extension 1    timeout=20
    Wait until page contains    Laajennuksen tyyppi    timeout=20
    Wait until page contains    Laskentahierarkia    timeout=20
    Wait until page contains    testiautomaatiokoodisto - testiautomaatiokoodisto1    timeout=20
    Sleep    1
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    testiautomaatiokoodisto - testiautomaatiokoodisto1    Koodi1000    ${EMPTY}
    Wait until page contains    Koodi1000 - Koodi1000    timeout=20
    Wait until page contains element    ${3_BREADCRUMB_LINK}    timeout=20
    Click element    ${3_BREADCRUMB_LINK}
    Sleep    5
    Wait until page contains element    //*[contains(text(), "- Member 1 · Koodi1000 · testiautomaatiokoodisto1 · Testirekisteri <=")]    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}    ${CODE_LIST_2}

611. Import code list with codes, extensions and members and create new version of code list
    [Documentation]    Import code list with codes, calculation and definition hierarchy extensions and hierachial members,
    ...    create new version of code list. Check that all values for codes, extensions and members are copied to the new
    ...    code list version. Export Excel and CSV for new code list version.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Extensions_new_version_creation}    ${CODE_LIST_14}
    Wait until page contains    25 koodia    timeout=20
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${CREATE_NEW_VERSION_BTN}    timeout=30
    Click element    ${CREATE_NEW_VERSION_BTN}
    Sleep    3
    Wait Until Element Is Enabled    ${CODE_LIST_VALUE_INPUT}    timeout=30
    Input text    ${CODE_LIST_VALUE_INPUT}    ${CODE_LIST_VALUE_5}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=30
    Input text    ${CODE_LIST_NAME_INPUT}    ${CODE_LIST_19}
    Sleep    2
    Wait until page contains element    ${SAVE_NEW_CODE_LIST}    timeout=30
    Click element    ${SAVE_NEW_CODE_LIST}
    Sleep    7
    Wait until page contains    25 koodia    timeout=20
    Wait until page contains element    //*[contains(text(), "Laajenna kaikki")]    timeout=20
    Log to Console    New version of code list created
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=30
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains    O1234567890123456789012345678901234567333    timeout=20
    Wait until page contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait until page contains    Testirekisteri    timeout=20
    Wait until page contains    Testiorganisaatio    timeout=20
    Wait until page contains    Asuminen    timeout=20
    Wait until page contains    Rakennettu ympäristö    timeout=20
    Wait until page contains    Yleiset tieto- ja hallintopalvelut    timeout=20
    Wait until page contains    englanti    timeout=20
    Wait until page contains    suomi    timeout=20
    Page should not contain    ruotsi
    Wait until page contains    testcode06 - Testikoodi 06    timeout=20
    Wait until page contains    31.12.2016 - 30.12.2018    timeout=20
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=30
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    //*[contains(text(), "MÄÄRITYSHIERARKIAT")]    timeout=20
    Wait until page contains element    //*[contains(text(), "LASKENTAHIERARKIAT")]    timeout=20
    Wait until page contains element    //*[contains(@id,'111_view_extension')]    timeout=20
    Click element    //*[contains(@id,'111_view_extension')]
    Wait until page contains element    ${EXTENSION_INFO_TAB}    timeout=30
    Click element    ${EXTENSION_INFO_TAB}
    Wait until page contains    O1234567890123456789012345678901234567111    timeout=20
    Wait until page contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait until page contains    Testilaajennus11    timeout=20
    Wait until page contains    Määrityshierarkia    timeout=20
    Wait until page contains    dcat - DCAT-AP-luokitus    timeout=20
    Wait until page contains    31.12.2016 - 30.12.2018    timeout=20
    Wait until page contains element    ${MEMBERS_TAB}    timeout=30
    Click element    ${MEMBERS_TAB}
    Wait until page contains element    //*[contains(text(), "Laajenna kaikki")]    timeout=20
    Wait until page contains element    //*[contains(text(), "Jäsen1 · Testikoodi 01")]    timeout=20
    Click element    //*[contains(text(), "Jäsen1 · Testikoodi 01")]
    Wait until page contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait until page contains    Testilaajennus11    timeout=20
    Wait until page contains    testcode01 - Testikoodi 01    timeout=20
    Wait until page contains    01.01.2018 - 01.01.2020    timeout=20
    Wait until page contains    URI    timeout=20
    Wait until page contains element    //*[contains(@id,'3_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'3_breadcrumb_link')]
    Wait until page contains element    //*[contains(text(), "Laajenna kaikki")]    timeout=20
    Wait until page contains element    //*[contains(text(), "educ · Koulutus, kulttuuri ja urheilu")]    timeout=20
    Click element    //*[contains(text(), "educ · Koulutus, kulttuuri ja urheilu")]
    Wait until page contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait until page contains    Testilaajennus11    timeout=20
    Wait until page contains    EDUC - Koulutus, kulttuuri ja urheilu - DCAT-AP-luokitus - Euroopan unionin koodistot    timeout=20
    Wait until page contains    08.01.2018 - 08.01.2020    timeout=20
    Wait until page contains    URI    timeout=20
    Wait until page contains element    //*[contains(@id,'2_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'2_breadcrumb_link')]
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=30
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    ${CALC_HIERARCHY_TAB}    timeout=30
    Click element    ${CALC_HIERARCHY_TAB}
    Wait until page contains element    //*[contains(@id,'222_view_extension')]    timeout=20
    Click element    //*[contains(@id,'222_view_extension')]
    Wait until page contains    9 jäsentä    timeout=20
    Wait until page contains element    //*[contains(text(), "Laajenna kaikki")]    timeout=20
    Wait until page contains element    //*[contains(text(), "- Jäsen1 · Testikoodi 08 · Testikoodisto3 pitkillä arvoilla · Testirekisteri <=")]    timeout=20
    Click element    //*[contains(text(), "- Jäsen1 · Testikoodi 08 · Testikoodisto3 pitkillä arvoilla · Testirekisteri <=")]
    Wait until page contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait until page contains    Testilaajennus22    timeout=20
    Wait until page contains    Jäsen1    timeout=20
    Wait until page contains    Vertailuoperaattori    timeout=20
    Wait until page contains    Aritmeettinen operaattori    timeout=20
    Wait until page contains    testcode08 - Testikoodi 08    timeout=20
    Wait until page contains    01.01.2018 - 01.01.2020    timeout=20
    Wait until page contains    URI    timeout=20
    Wait until page contains element    //*[contains(@id,'2_breadcrumb_link')]
    Click element    //*[contains(@id,'2_breadcrumb_link')]
    Wait until page contains element    ${VERSION_TAB}    timeout=30
    Click element    ${VERSION_TAB}
    Wait until page contains    Testikoodisto3 pitkillä arvoilla    timeout=20
    Wait until page contains    Testikoodisto2 pitkillä arvoilla    timeout=20
    Wait until page contains    Nimi    timeout=20
    Wait until page contains    Voimassaolo    timeout=20
    Wait until page contains    Tila    timeout=20
    Wait until page contains    Luonnos    timeout=20
    Wait until page contains    Voimassa oleva    timeout=20
    Wait until page contains element    //*[contains(@id,'2_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'2_breadcrumb_link')]
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_EXCEL}
    Sleep    5
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_TYPE_CSV}
    Sleep    5
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_19}    ${CODE_LIST_14}

612. Import members with invalid member value
    [Documentation]    Import members with invalid unary operator value to calculation hierarchy extension
    ...    and check error message.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Sleep    2
    Wait until page contains    30 koodia    timeout=20
    Upload extension    ${Extension_calculation_hierarchy}    ${FILE_FORMAT_EXCEL}
    Wait until page contains element    //*[contains(@id,'555_view_extension')]    timeout=20
    Click Element    //*[contains(@id,'555_view_extension')]
    Upload members    ${Invalid_unaryoperator_value}    ${FILE_FORMAT_EXCEL}
    Sleep    5
    Wait until page contains    ${Error_member_value_invalid}    timeout=20
    Cancel code import
    Sleep    2
    Upload members    ${Invalid_unaryoperator_value_csv}    ${FILE_FORMAT_CSV}
    Wait until page contains    ${Error_member_value_invalid}    timeout=20
    Cancel code import
    Sleep    2
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}

613. Remove code list when codes are in use in other resources in the same code list
    [Documentation]    Import code list with codes, calculation and definition hierarchy extensions and hierachial members,
    ...    Check that it is possible to remove code list when codes are in use in other resources in the same code list.
    [Tags]    koodistot    regression    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Extensions_new_version_creation}    ${CODE_LIST_14}
    Wait until page contains    25 koodia    timeout=20
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Return to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_14}
    Wait until page contains    Haulla ei löytynyt yhtään koodistoa.
    Log to Console    ${CODE_LIST_14} removed

614. Import extensions in CSV format
    [Documentation]    Import code list with codes and import extension,
    ...    Import members in CSV format and export CSV.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Upload extension    ${Calc_def_hierarchy_extensions_csv}    ${FILE_FORMAT_CSV}
    Wait until page contains element    //*[contains(@id,'111_view_extension')]    timeout=20
    Wait until page contains element    ${CALC_HIERARCHY_TAB}    timeout=20
    Click Element    ${CALC_HIERARCHY_TAB}
    Wait until page contains element    //*[contains(@id,'222_view_extension')]    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}

615. Import extensions to the versioned code list
    [Documentation]    Import code list with codes, create new version from file and import extensions
    ...    in CSV format to the new code list version. Check that versions are listed correctly, YTI-1163.
    [Tags]    regression    koodistot    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes_valid}    ${CODE_LIST_17}
    Wait until page contains    30 koodia    timeout=20
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    testcode29 - Testcode 29    timeout=20
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Click element    ${CREATE_CODELIST_VERSION_FROM_FILE}
    Wait until page contains element    ${FILE_FORMAT_BTN}    timeout=20
    Click element    ${FILE_FORMAT_BTN}
    Wait until page contains element    ${FILE_FORMAT_Excel}    timeout=20
    Click element    ${FILE_FORMAT_Excel}
    Wait until page contains element    ${FILE_UPLOAD_BTN}    timeout=20
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Upload extension    ${Calc_def_hierarchy_extensions_csv}    ${FILE_FORMAT_CSV}
    Wait until page contains element    //*[contains(@id,'111_view_extension')]    timeout=20
    Click element    //*[contains(@id,'111_view_extension')]
    Sleep    2
    Wait until page contains element    ${2_BREADCRUMB_LINK}    timeout=20
    Click Element    ${2_BREADCRUMB_LINK}
    Sleep    2
    Wait until page contains element    ${VERSION_TAB}    timeout=30
    Click element    ${VERSION_TAB}
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Koodisto700    timeout=20
    Wait until page contains    01.01.2018 - 01.01.2019    timeout=20
    Wait until page contains    Luonnos    timeout=20
    Log to Console    All versions are listed
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}    ${CODE_LIST_17}

616. Modify code list and codes attached to extensions and members
    [Documentation]    Modify the name of the code list and code that are attached to extensions and members.
    ...    Check that changes take effect on extensions and members.
    [Tags]    koodistot    regression    600
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Return to Koodistot frontpage
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Sleep    2
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_2}    False
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click Element    //*[contains(text(), "TIEDOT")]
    Wait until page contains    Koodisto    timeout=20
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennuksen tunnus    timeout=20
    Wait until page contains    extension1    timeout=20
    Wait until page contains    Laajennuksen nimi    timeout=20
    Wait until page contains    Extension 1    timeout=20
    Wait until page contains    Laajennuksen tyyppi    timeout=20
    Wait until page contains    Laskentahierarkia    timeout=20
    Wait until page contains    testiautomaatiokoodisto - testiautomaatiokoodisto1    timeout=20
    Sleep    1
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    testiautomaatiokoodisto - testiautomaatiokoodisto1    Koodi1000    ${EMPTY}
    Wait until page contains    Koodi1000 - Koodi1000    timeout=20
    Wait until page contains element    //*[contains(@id,'3_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'3_breadcrumb_link')]
    Sleep    5
    Wait until page contains element    //*[contains(text(), "- Member 1 · Koodi1000 · testiautomaatiokoodisto1 · Testirekisteri <=")]    timeout=20
    Return to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_2}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_2}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_2}")]
    Wait until page contains    ${CODE_LIST_2}
    Wait until page contains element    ${CODELIST_INFO_TAB}    timeout=20
    Click element    ${CODELIST_INFO_TAB}
    Wait until page contains element    ${MODIFY_CODE_LIST}    timeout=20
    Click element    ${MODIFY_CODE_LIST}
    Wait until page contains element    ${CODE_LIST_NAME_INPUT}    timeout=30
    Input text    ${CODE_LIST_NAME_INPUT}    uusi nimi koodistolle
    Save code list
    Log to Console    Code list name changed
    Sleep    4
    Wait until page contains element    ${CODELIST_CODES_TAB}    timeout=30
    Click element    ${CODELIST_CODES_TAB}
    Wait until page contains element    //*[contains(text(), "Koodi1000 - Koodi1000")]    timeout=20
    Click element    //*[contains(text(), "Koodi1000 - Koodi1000")]
    Wait until page contains element    ${MODIFY_CODE_BTN}    timeout=20
    Click element    ${MODIFY_CODE_BTN}
    Wait until page contains element    ${CODE_NAME_INPUT}    timeout=20
    Input text    ${CODE_NAME_INPUT}    koodin uusi nimi
    Wait until page contains element    ${SAVE_CODE_MOD_BTN}    timeout=20
    Click element    ${SAVE_CODE_MOD_BTN}
    Log to Console    Code name changed
    Sleep    4
    Return to Koodistot frontpage
    Sleep    2
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_16}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_16}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_16}")]
    Wait until page contains    ${CODE_LIST_16}
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=30
    Click element    ${EXTENSIONS_TAB}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "extension1 - Extension 1")]    timeout=20
    Click element    //*[contains(text(), "extension1 - Extension 1")]
    Wait until page contains element    ${EXTENSION_INFO_TAB}    timeout=20
    Click Element    ${EXTENSION_INFO_TAB}
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    extension1    timeout=20
    Wait until page contains    Extension 1    timeout=20
    Wait until page contains    Laskentahierarkia    timeout=20
    Wait until page contains    testiautomaatiokoodisto - uusi nimi koodistolle    timeout=20
    Wait until page contains element    ${MEMBERS_TAB}    timeout=20
    Click Element    ${MEMBERS_TAB}
    Wait until page contains element    //*[contains(text(), "- Member 1 · koodin uusi nimi <=")]    timeout=20
    Click element    //*[contains(text(), "- Member 1 · koodin uusi nimi <=")]
    Wait until page contains    Koodi1000 - koodin uusi nimi - uusi nimi koodistolle - Testirekisteri    timeout=20
    Log to Console    Code list and code name changed in extension and in member
    Return to Koodistot frontpage
    [Teardown]    Remove code lists with extensions    ${CODE_LIST_16}    uusi nimi koodistolle

617. Remove code list which is linked to other resources
    [Documentation]    Remove code list which has codes attached to other code list extension.
    ...    Check that removing the code list is not possible. YTI-1229.
    [Tags]    koodistot    regression    600
    [Setup]    Test Case Setup Admin
    Import code list in Excel format
    Upload codelist    ${testiautomaatiokoodisto1_with_codes}    ${CODE_LIST_2}
    Return to Koodistot frontpage
    Import code list in Excel format
    Upload codelist    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Sleep    2
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_2}    False
    Wait until page contains element    //*[contains(text(), "TIEDOT")]    timeout=20
    Click Element    //*[contains(text(), "TIEDOT")]
    Wait until page contains    Koodisto    timeout=20
    Wait until page contains    Koodisto600    timeout=20
    Wait until page contains    Laajennuksen tunnus    timeout=20
    Wait until page contains    extension1    timeout=20
    Wait until page contains    Laajennuksen nimi    timeout=20
    Wait until page contains    Extension 1    timeout=20
    Wait until page contains    Laajennuksen tyyppi    timeout=20
    Wait until page contains    Laskentahierarkia    timeout=20
    Wait until page contains    testiautomaatiokoodisto - testiautomaatiokoodisto1    timeout=20
    Sleep    1
    Create member for calculation hierarchy    ${MEMBER_NAME_1}    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    testiautomaatiokoodisto - testiautomaatiokoodisto1    Koodi1000    ${EMPTY}
    Wait until page contains    Koodi1000 - Koodi1000    timeout=20
    Wait until page contains element    //*[contains(@id,'3_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'3_breadcrumb_link')]
    Sleep    5
    Wait until page contains element    //*[contains(text(), "- Member 1 · Koodi1000 · testiautomaatiokoodisto1 · Testirekisteri <=")]    timeout=20
    Return to Koodistot frontpage
    Wait Until Element Is Visible    ${SEARCH_BOX_INPUT}    timeout=30
    Input Text    ${SEARCH_BOX_INPUT}    ${CODE_LIST_2}
    Wait until page contains element    //*[contains(text(), "${CODE_LIST_2}")]    timeout=30
    Click element    //*[contains(text(), "${CODE_LIST_2}")]
    Wait until page contains    ${CODE_LIST_2}
    Wait until page contains element    ${CODE_LIST_DDL}    timeout=20
    Click element    ${CODE_LIST_DDL}
    Wait until page contains element    ${DELETE_CODE_LIST_BTN}    timeout=20
    Click element    ${DELETE_CODE_LIST_BTN}
    Wait until page contains element    ${REMOVE_CODE_LIST_CONF_BTN}    timeout=20
    Click element    ${REMOVE_CODE_LIST_CONF_BTN}
    Wait until page contains    Koodistoa ei voi poistaa, koska joko koodisto tai sen koodit on linkitettynä käytössä seuraavissa resursseissa: http://uri.suomi.fi/codelist/test/600/extension/extension1    timeout=20
    Wait until page contains element    ${CLOSE_ERROR_MESSAGE_BTN}    timeout=20
    Click button    ${CLOSE_ERROR_MESSAGE_BTN}
    Log to Console    Removing linked code list is not possible
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}    ${CODE_LIST_2}

618. Create member with broader member
    [Documentation]    Import new code list and create calculation hierarchy extension. Create member with broader member manually.
    [Tags]    koodistot    600
    [Setup]    Test Case Setup Superuser
    Import code list in Excel format
    Upload codelist    ${Extensions_new_version_creation}    ${CODE_LIST_14}
    Wait until page contains    testcode01 - Testikoodi 01    timeout=20
    Wait until page contains    25 koodia    timeout=20
    Wait until page contains element    ${EXTENSIONS_TAB}    timeout=20
    Click element    ${EXTENSIONS_TAB}
    Wait until page contains element    ${CALC_HIERARCHY_TAB}    timeout=20
    Click element    ${CALC_HIERARCHY_TAB}
    Wait until page contains element    //*[contains(@id,'222_view_extension')]    timeout=20
    Click element    //*[contains(@id,'222_view_extension')]
    Create member for calculation hierarchy    Jäsen10    ${COMPARISON_OPERATOR_1}    ${UNARY_OPERATOR_1}    ${EMPTY}    Testikoodi 01    Jäsen9
    Wait until page contains    - Jäsen10 · Testikoodi 01 <=    timeout=20
    Wait until page contains element    //*[contains(@id,'3_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'3_breadcrumb_link')]
    Wait until page contains    Testilaajennus22    timeout=20
    Wait until page contains    10 jäsentä    timeout=20
    Wait until page contains element    ${EXPAND_ALL_BTN}    timeout=30
    Click element    ${EXPAND_ALL_BTN}
    Sleep    2
    Wait until page contains element    //*[contains(text(), "- Jäsen10 · Testikoodi 01 <=")]    timeout=20
    Sleep    1
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_14}

619. Import code list, create members and create cross-reference list
    [Documentation]    Import code list, create members and create cross-reference list, export cross_reference list Excel and CSV
    ...    and delete cross-reference list and code lists.
    [Tags]    koodistot    regression    600
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_for_cross_reference_list_creation}    ${CODE_LIST_22}
    Wait until page contains    30 koodia    timeout=20
    Return to Koodistot frontpage
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    testcode28 - Testcode 28    timeout=20
    Wait until page contains    30 koodia    timeout=20
    Create extension    ${CROSS_REFERENCE_LIST}    koodiliitoslaajennus    Koodiliitoslaajennus    ${DRAFT_STATUS}    ${CODE_LIST_22}    True
    Sleep    5
    Wait until page contains    60 jäsentä    timeout=20
    Wait until page contains element    //*[contains(text(), "Testcode 30 · Testcode 30 · Koodisto600 · Testirekisteri")]    timeout=20
    Click element    //*[contains(text(), "Testcode 30 · Testcode 30 · Koodisto600 · Testirekisteri")]
    Wait until page contains element    ${MODIFY_MEMBER_BTN}    timeout=20
    Click element    ${MODIFY_MEMBER_BTN}
    Wait until page contains element    ${ADD_MEMBER_BTN}    timeout=20
    Click element    ${ADD_MEMBER_BTN}
    Wait until page contains element    ${CODE_SCHEME_DDL_BTN}    timeout=20
    Click element    ${CODE_SCHEME_DDL_BTN}
    Sleep    10
    Wait until page contains element    //*[contains(text(), "800 - Koodisto800")]    timeout=20
    Click element    //*[contains(text(), "800 - Koodisto800")]
    Wait until page contains element    //*[contains(text(), "testcode63 - Testcode 63")]    timeout=20
    Click element    //*[contains(text(), "testcode63 - Testcode 63")]
    Sleep    1
    Wait until page contains element    ${SAVE_MEMBER}    timeout=20
    Click element    ${SAVE_MEMBER}
    Sleep    3
    Wait until page contains element    //*[contains(@id,'3_breadcrumb_link')]    timeout=30
    Click element    //*[contains(@id,'3_breadcrumb_link')]
    Wait until page contains element    //*[contains(text(), "Testcode 30 · Testcode 30 · Koodisto600 · Testirekisteri")]    timeout=20
    Wait until page contains element    //*[contains(text(), "Testcode 63 · Testcode 63 · Koodisto800 · Testirekisteri")]    timeout=20
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_CROSS_REFERENCE_EXCEL}
    Sleep    1
    Wait until page contains element    ${EXPORT_DDL}    timeout=20
    Click element    ${EXPORT_DDL}
    Click element    ${EXPORT_CROSS_REFERENCE_CSV}
    Sleep    1
    Delete extension
    Page Should Not Contain element    //*[contains(text(), "LAAJENNUKSET")]
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}    ${CODE_LIST_22}

620. Automatic member creation for codes
    [Documentation]    Import two code lists with codes, create calculation hierarchy extension and add other code list to the extension.
    ...    Create automatically members and check that members are created for each code from both code lists.
    [Tags]    koodistot    regression    600
    [Setup]    Test Case Setup Superuser
    Upload codelist in excel format    ${Code_list_for_cross_reference_list_creation}    ${CODE_LIST_22}
    Wait until page contains    30 koodia    timeout=20
    Return to Koodistot frontpage
    Upload codelist in excel format    ${Code_list_with_30_Codes}    ${CODE_LIST_16}
    Wait until page contains    30 koodia    timeout=20
    Create extension    ${CALCULATION_HIERARCHY}    ${EXTENSION_VALUE_1}    ${EXTENSION_NAME_1}    ${DRAFT_STATUS}    ${CODE_LIST_22}    True
    Wait until page contains    60 jäsentä    timeout=20
    Return to Koodistot frontpage
    [Teardown]    Remove code lists    ${CODE_LIST_16}    ${CODE_LIST_22}
