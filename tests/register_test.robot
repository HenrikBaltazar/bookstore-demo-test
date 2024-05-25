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
     When I fill Lorem ipsum in name text field
      And I fill lorem@ipsum.com in e-mail text field
      And I fill foo123 in password text field  
      And I fill foo123 in confirm password text field
      And I select Pessoa Física in business entity combo box
      And I accept the terms of use
      And I submit register form
     Then I should see the Lorem ipsum, teu cadastro foi realizado com sucesso! success message
      And I should see My Wish List
      And I should see My Orders

Scenario: Successfully sign in as a juridical person
    Given I am on Bookstore Demo web site
      And I go to log in or sign in page
     When I fill Lorem ipsum LTDA in name text field
      And I fill contact@ipsum.com in e-mail text field
      And I fill foo123 in password text field  
      And I fill foo123 in confirm password text field
      And I select Pessoa Jurídica in business entity combo box
      And I accept the terms of use
      And I submit register form
     Then I should see the Lorem ipsum LTDA, teu cadastro foi realizado com sucesso! success message
      And I should see My Wish List
      And I should see My Orders


