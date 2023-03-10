Feature: Answering survey questions
As a user
I want to be able to answer the questions
So that I can get a score for the questions on the survey
Background: Question and surveys and users in database:

Given the following users exist:
| first_name | last_name | phone_number | address_line_1 | address_line_2 | zip | city | state | date_of_birth | email | password | confirmation_token | confirmed_at | confirmation_sent_at |
| Test | User | 1231231234 | 123 Street | | 12345 | College Station | Texas | 1999-01-01 | testuser@test.com | Test123 | 123 | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |
| Test | User2 | 1231231234 | 123 Street | APT 123 | 12345 | College Station | Texas | 1999-01-01 | testuser2@test.com | Test123 | 123 | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |

Given the following surveys exist:
| survey_name | survey_category | languages |
| U.S. Household Food Security Survey | Food Security | English, Spanish, Chinese |
|Six-Item Short Form of the Food Security Survey | Food Security | English |

Given the following questions exist in database:
| survey_id | language | question_text | options_list | option_points_list | question_number |
| 1 | English | Do you have children under the age of 18 in your household? | "No", "Yes" | 0, 1 | 1 |
| 1 | English | Which of these statements best describes the food eaten in your household in the last 12 months? | "Enough of the kinds of food we want to eat", "Enough, but not always the kinds of food we want", "Sometimes not enough to eat", "Often not enough to eat", "I don't know, or I refuse to answer" | 0, 1, 2, 3, 4, 5 | 2 |
| 1 | Spanish | Tiene hijos menores de 18 años en su hogar? | "No", "Si" | 0, 1 | 1 |
| 1 | Spanish | Cuál de las siguientes declaraciones describe mejor la situación alimentaria en su hogar en los últimos 12 meses? | "Siempre comemos lo suficiente y los tipos de alimentos que deseamos", "Comemos lo suficiente pero no siempre lo que deseamos", "A veces no comemos lo suficiente", "Frecuentemente no comemos lo suficiente", "No sé, o me niego a responder" | 1, 2, 3, 4, 5 | 2 |

Scenario: User is not logged in and tries to access the questions
Given user is not logged in
When user visits the home screen
Then user should be redirected to the login page with a flash message "You need to sign in or sign up before continuing."

Scenario: User is logged in and can view the questions
Given that the user is logged in 
And there is a survey with id 
When the user navigates to the survey page 
Then the user should be able to see the questions for survey 

Scenario: User can selection the options
Given that the user is logged in
And there is a survey with id 
And the user has navigated to the survey page
When the user selects an option for each question 
And submits the survey 
Then the user should be able to see their score for survey 

# Scenario: User can answer survey questions
# Scenario: User must answer all survey questions 
# Scenario: User can change their answers before submitting
