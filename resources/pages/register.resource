*** Settings ***
Library  SeleniumLibrary
Resource  ../page_objects/register_page_object.resource

*** Keywords ***
I fill ${name} in name text field 
    Input Text                  ${NAME_TEXT_FIELD}    ${name}

I fill ${mail} in e-mail text field
    Input Text                  ${MAIL_TEXT_FIELD}    ${mail}

I fill ${pass} in password text field
    Input Password              ${PASS_TEXT_FIELD}    ${pass}

I fill ${confirm_pass} in confirm password text field
    Input Password              ${CONFIRM_PASS_TEXT_FIELD}    ${confirm_pass}

I select ${business_entity} in business entity combo box
    Select From List By Label   ${BUSINESS_ENTITY_COMBOBOX}    ${business_entity}

I accept the terms of use
    Select Checkbox             ${TERMS_OF_USE_CHECKBOX}

I submit register form
    Submit Form                 ${REGISTER_BUTTON}

I should see the ${message} success message
    Wait Until Page Contains   Lorem ipsum, teu cadastro foi realizado com sucesso!
