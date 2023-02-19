Feature: Application Signup

  As a patient
  I want to be able to create an account
  So that the application can gather the required information (Name, email, etc.).

Background: Users in database

  Given the following users exist:
  | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip   | city            | state        | date_of_birth | email             | password |
  | Test       | User      | 1231231234   | 123 Street     |                | 12345 | College Station | Texas        | 1999-01-01    | testuser@test.com | Test123  |

Scenario: A new user signups successfully
  When I go to signup
  And I enter valid patient signup information
  And I click "Sign up"
  Then I should be redirected to the welcome page
  And I should see "Welcome! You have signed up successfully."
