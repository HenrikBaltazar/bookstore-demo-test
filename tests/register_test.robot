*** Settings ***
Documentation       As a e-commerce customer, i wish to make my
...                 registration to the system so i can visualize
...                 my orders and wishlist.

Library             SeleniumLibrary
Resource            ../resources/config.resource
Resource            ../resources/pages/home.resource
Resource            ../resources/pages/menu.resource
Resource            ../resources/pages/account.resource
Resource            ../resources/pages/register.resource

Test Setup          Open Browser    ${URL}    ${BROWSER}
Test Teardown       Close Browser


*** Test Cases ***
Scenario: Successfully sign in as a natural person
    Given I am on Bookstore Demo web site
      And I go to log in or sign in page
     When I fill register Form  
          ...  name=Lorem ipsum  mail=lorem@ipsum.com  pass=foo123
          ...  confirm_pass=foo123  business_entity=Pessoa Física
      And I accept the terms of use
      And I submit register form
     Then I should see a success message
          ...  message=Lorem ipsum, teu cadastro foi realizado com sucesso!
      And I should see My Wish List
      And I should see My Orders

Scenario: Successfully sign in as a juridical person
    Given I am on Bookstore Demo web site
      And I go to log in or sign in page
     When I fill register Form  
          ...  name=Lorem ipsum LTDA  mail=contact@ipsum.com  pass=foo123
          ...  confirm_pass=foo123  business_entity=Pessoa Jurídica
      And I accept the terms of use
      And I submit register form
     Then I should see a success message
          ...  message=Lorem ipsum LTDA, teu cadastro foi realizado com sucesso!
      And I should see My Wish List
      And I should see My Orders


