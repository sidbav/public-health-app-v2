Feature: Response table features
  As a developer
  I want to ensure that the responses table is properly set up
  So that I can save survey responses in the database

  Scenario: Create a response
    Given a survey with id 1 exists
    And a user with id 1 exists
    When I create a response with the following attributes:
      | survey_id             | user_id | question_number | response_score | response_option_number |
      | 1                     | 1       | "question 1"    | 4              | 1                      |
    Then the response should be saved in the database
    And the response should have the following attributes:
      | survey_id | user_id | question_number | response_score | response_option_number |
      | 1         | 1       | "question 1"    | 4              | 1                      |

  Scenario: Update a response
    Given a response with id 1 exists
    When I update the response with the following attributes:
      | response_score |
      | 5              |
    Then the response should be updated in the database
    And the response should have the following attributes:
      | id | survey_id | user_id | question_number | response_score | response_option_number |
      | 1  | 1         | 1       | "question 1"    | 5              | 1                      |

  Scenario: Delete a response
    Given a response with id 1 exists
    When I delete the response with id 1
    Then the response should not exist in the database
