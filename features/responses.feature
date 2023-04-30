Feature: Submitting survey responses correctly
As a user
I want to be able to submit the responses
So that I can get a score for the questions on the survey
Background: Question and surveys and users in database:

Given the following users exist:
| gender | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip | city | state | date_of_birth | email | password | confirmation_token | confirmed_at | confirmation_sent_at |
| Female | Test | User | 1231231234 | 123 Street | | 12345 | College Station | Texas | 1999-01-01 | testuser@test.com | Test123 | 123 | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |
| Female | Test | User2 | 1231231234 | 123 Street | APT 123 | 12345 | College Station | Texas | 1999-01-01 | testuser2@test.com | Test123 | 123 | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |

Given the following surveys exist:
| id | survey_name | survey_category | languages |
| 1 | U.S. Household Food Security Survey | Food Security | English, Spanish, Chinese |
| 2 |Six-Item Short Form of the Food Security Survey | Food Security | English |
| 3 | Testing | Testing Purposes | English |




Given the following questions exist:
| survey_id | language | question_text | options_list | option_points_list | question_number | child | option_selected_to_display_child | parent_question_number |
| 1         | English | Do you have children under the age of 18 in your household? | "No", "Yes" | 0, 1 | 1 ||||
| 1         | English | Which of these statements best describes the food eaten in your household in the last 12 months? | "Enough of the kinds of food we want to eat", "Enough, but not always the kinds of food we want", "Sometimes not enough to eat", "Often not enough to eat", "I don't know, or I refuse to answer" | 0, 1, 2, 3, 4, 5 | 2 ||||
| 1         | Spanish | Tiene hijos menores de 18 años en su hogar? | "No", "Si" | 0, 1 |1||||
| 1         | Spanish | Cuál de las siguientes declaraciones describe mejor la situación alimentaria en su hogar en los últimos 12 meses? | "Siempre comemos lo suficiente y los tipos de alimentos que deseamos", "Comemos lo suficiente pero no siempre lo que deseamos", "A veces no comemos lo suficiente", "Frecuentemente no comemos lo suficiente", "No sé, o me niego a responder" | 1, 2, 3, 4, 5 | 2 | | | |
| 3         | English | Are you 18 years of age or older? | Yes, No | 1, 0 | 1 | 1A | Yes |<null>|
| 3         | English | You should only see this question if response was "Yes" to the previous question | Okay, Not Okay | 1, 0 | 1A |<null>|<null>| 1 |
| 3         | English | You should see this question anyways | Yes I do, No I don't | 1, 0 | 2 |<null>|<null>|<null>|




@javascript
Scenario: Submitting Correct Response
  Given I am logged in
  When I visit home page
  When I click on the survey link
  Then I should see a table Surveys
  When I click on the "Take Survey" link on the third row
  And I click on the "English" link
  When I select Option "No" for Question 1 for the Testing Survey
  And I select Option "Yes I do" for Question 2 for the Testing Survey
  And I click the Submit button
   Then I should see an alert "Responses saved successfully"

@javascript
Scenario: Submitting Wrong Response
  Given I am logged in
  When I visit home page
  When I click on the survey link
  Then I should see a table Surveys
  When I click on the "Take Survey" link on the third row
  And I click on the "English" link
  When I select Option "No" for Question 1 for the Testing Survey
  And I click the Submit button
    Then I should see an alert "Survey is not completed, please answer all questions"


@javascript
Scenario: Submitting Correct Response with conditional questions
  Given I am logged in
  When I visit home page
  When I click on the survey link
  Then I should see a table Surveys
  When I click on the "Take Survey" link on the third row
  And I click on the "English" link
  When I select Option "Yes" for Question 1 for the Testing Survey
  When I select Option "Okay" for Question 1A for the Testing Survey
  And I select Option "Yes I do" for Question 2 for the Testing Survey
  And I click the Submit button
   Then I should see an alert "Responses saved successfully"

@javascript
Scenario: Submitting Wrong Response with conditional questions
  Given I am logged in
  When I visit home page
  When I click on the survey link
  Then I should see a table Surveys
  When I click on the "Take Survey" link on the third row
  And I click on the "English" link
  When I select Option "Yes" for Question 1 for the Testing Survey
  And I select Option "Yes I do" for Question 2 for the Testing Survey
  And I click the Submit button
    Then I should see an alert "Survey is not completed, please answer all questions"

