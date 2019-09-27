*** Variables ***
${Browser}  chrome
@{List_URL}    https://vk.com/  https://kassa.rambler.ru/
${number_event}  92507
${city_event}	msk/movie/
${first_name}   Nick
${last_name}    Fisher
${new_phone}    9159534001



*** Settings ***
Library  SeleniumLibrary


*** KeyWords ***
# ------------------- Регистрация в вк -------------------
Open Chrome Browser
    Open Browser  @{List_URL}[1]${city_event}${number_event}  ${Browser}
    Maximize Browser Window
    Set Browser Implicit Wait  5

Registration vk

    # enter first and last name
    Input Text  id=ij_first_name    ${first_name}
    Input Text  id=ij_last_name    ${last_name}
    # selection group - day, mounth and year

    Click Element   id=dropdown1
    Click Element   id=option_list_options_container_1_4
    Click Element   id=dropdown2
    Click Element   id=option_list_options_container_2_5
    Click Element   id=dropdown3
    Click Element   id=option_list_options_container_3_14
    Click Element   id=ij_submit
    Click Element   class=radiobtn
    Click Element   id=ij_submit

Enter userdate



Confirmation of registration
    Input text  id=join_phone   ${new_phone}
    Click Element   xpath=//div[@id='join_accept_terms_checkbox']//div[@class='checkbox']
    Click Element   id=join_phone_submit


# ------------   конец регистрации в вк -------------------




# ------------------- Открытие сеанса события\ фильма\ спорта\ театра -------------------
Open Rambler Kassa
    Open Browser  @{List_URL}[1]${city_event}${number_event}  ${Browser}
    Set Window Size  980  620
    Set Browser Implicit Wait  5


Select Time session
    @{list_date_time}=  Get WebElements  class=date_item__time
    Click Element   @{list_date_time}[2]
    Sleep    3
    Wait Until Page Contains Element  xpath://li[@data-session]
    @{list_session_time}=  Get WebElements  xpath://li[@data-session]
    Click Element   @{list_session_time}[2]


Select places in Widget
    Select Frame    class=widget_2_iframe
    @{list_places}=  Get WebElements  class=_1aGabE2p
    Click Element  @{list_places}[5]
    @{list_buttons}=  Get WebElements  class=ui-btn
    Click Element  @{list_buttons}[3]
    Sleep    5

Close Chrome Browser
    Close Browser
