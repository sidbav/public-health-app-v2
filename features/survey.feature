Feature: Survey Feature
  As a user
  I want to be able to fill out a survey
  So that I can give feedback on the product

Background: surveys and users in database
  Given the following surveys exist:
  | id | survey_name | survey_category | languages |
  | 1 | U.S. Household Food Security Survey | Food Security | English, Spanish, Chinese |
  | 2 | Six-Item Short Form of the Food Security Survey | Food Security | English |


  Given the following users exist:
  | gender | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip   | city            | state        | date_of_birth | email             | password | confirmation_token   | confirmed_at               | confirmation_sent_at       |
  | Female | Test       | User      | 1231231234   | 123 Street     |                | 12345 | College Station | Texas        | 1999-01-01    | testuser@test.com | Test123  | 123                  | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |
  | Female | Test       | User2     | 1231231234   | 123 Street     | APT 123        | 12345 | College Station | Texas        | 1999-01-01    | testuser2@test.com | Test123  | 123                  | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |


Scenario: User is not logged in and tries to access the survey
  Given I am not logged in
  When I visit the home screen
  Then I should be redirected to the login page with a flash message "You need to sign in or sign up before continuing."

Scenario: User is logged in and can access the survey
  Given I am logged in
  When I visit the home screen
  Then I should see a link to fill out the survey

Scenario: User can view list of surveys
  Given I am logged in
  When I click on the survey link
  Then I should see a table Surveys

Scenario: User can select survey from surveys
  Given I am logged in
  When I click on the survey link
  Then I should see a table Surveys
  When I click on the "Take Survey" link on the first row
  Then I should see the "English", "Spanish", and "Chinese" links



