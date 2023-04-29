Feature: SurveyResult Feature
  As a user
  I want to be able to access my survey results
  So that I can track my category health progress
Background: Categories and survey_results and questions and surveys and users in database:

Given the following users exist:
|gender | id | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip | city | state | date_of_birth | email | password | confirmation_token | confirmed_at | confirmation_sent_at |
| Male | 1 | Test | User | 1231231234 | 123 Street | | 12345 | College Station | Texas | 1999-01-01 | testuser@test.com | Test123 | 123 | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |
|Male | 2 | Test | User2 | 1231231234 | 123 Street | APT 123 | 12345 | College Station | Texas | 1999-01-01 | testuser2@test.com | Test123 | 123 | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |

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
| 2         | English | "The food that (I/we) bought just didn't last, and (I/we) didn't have money to get more.” Was that often, sometimes, or never true for (you/your household) in the last 12 months? | "Often True","Sometimes True","Never True","Don't Know or Refused" | 1,1,0,0 | HH3 ||||
| 2         | English | "(I/we) couldn't afford to eat balanced meals." Was that often, sometimes, or never true for (you/your household) in the last 12 months? | "Often True","Sometimes True","Never True","Don't Know or Refused" | 1,1,0,0 | HH4 ||||
| 2         | English | In the last 12 months, since last (name of current month), did (you/you or other adults in your household) ever cut the size of your meals or skip meals because there wasn't enough money for food? | "Yes","No","Don't Know" | 1,0,0 | AD1 | AD1a | Yes ||
| 2         | English | How often did this happen—almost every month, some months but not every month, or in only 1 or 2 months? | "Almost Every Month","Some months but not every month","Only 1 month or 2 months","Don't Know" | 1,1,0,0 | AD1a | AD1 |||
| 2         | English | In the last 12 months, did you ever eat less than you felt you should because there wasn't enough money for food? |"Yes","No","Don't Know" | 1,0,0 | AD2 ||||
| 2         | English | In the last 12 months, were you ever hungry but didn't eat because there wasn't enough money for food? |"Yes","No","Don't Know" | 1,0,0 | AD3 ||||
| 3         | English | Are you 18 years of age or older? | Yes, No | 1, 0 | 1 | 1A | Yes |<null>|
| 3         | English | You should only see this question if response was "Yes" to the previous question | Yes, No | 1, 0 | 1A |<null>|<null>| 1 |
| 3         | English | You should see this question anyways | Yes I do, No I don't | 1, 0 | 2 |<null>|<null>|<null>|

Given the following survey_results exist:
| survey_id | users_id | total_score | time_submitted | categories_id|
| 2 | 1 | 2 | Mon Apr 24 2023 05:27:24 GMT-0500 (Central Daylight Time)| 3 |
| 2 | 1 | 4 | Mon Apr 24 2023 06:03:49 GMT-0500 (Central Daylight Time)| 3 |
| 2 | 1 | 6 | Mon Apr 24 2023 06:39:34 GMT-0500 (Central Daylight Time) | 4 |
| 2 | 1 | 4 | Mon Apr 24 2023 07:15:59 GMT-0500 (Central Daylight Time) | 3 |

Given the following categories exist:
| surveys_id | low_score | high_score | category |
| 2 | 0 | 0 | High Food Security |
| 2 | 1 | 1 | Marginal Food Security |
| 2 | 2 | 4 | Low Food Security |
| 2 | 5 | 6 | Very Low Food Security |
| 3 | 0 | 0 | High Food Security |
| 3 | 1 | 1 | Marginal Food Security |
| 3 | 2 | 4 | Low Food Security |
| 3 | 5 | 6 | Very Low Food Security |


@javascript
Scenario: Check if there are responses and display the expected category
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
  Then I accept the alert
  And I wait to get to survey screen
  Then I should see a table Surveys
  And I click on the "See Your Responses" link on third row
  Then I see Category "Low Food Security"

@javascript
Scenario: Don't display category if no responses submitted
 Given I am logged in
 When I visit home page
 When I click on the survey link
 Then I should see a table Surveys
 And I click on the "See Your Responses" link on third row
 Then I should not see any category displayed
