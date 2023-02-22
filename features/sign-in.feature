Feature: Application Sign in

  As a patient
  I want to log into the application
  So I can access the health surveys, gain access to resources and share the results of the surveys with my doctor. 

Background: Users in database

  Given the following users exist:
  | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip   | city            | state        | date_of_birth | email             | password |
  | Test       | User      | 1231231234   | 123 Street     |                | 12345 | College Station | Texas        | 1999-01-01    | testuser@test.com | Test123  |




Scenario: Signed up users providing correct credetials can sign in
  When I go to the sign in page
  And I enter the correct email and password for a user who is signed up
  And I click "Log in"
  Then I should be redirected to the welcome page
  And I should see "Signed in successfully."


Scenario: Only users who signed up can sign in
  When I go to the sign in page
  And I enter an email for a user who is not signed up
  And I click "Log in"
  Then I should stay on the sign in page
  And I should see "Invalid Email or password."

Scenario: Only users with correct password can sign in
  When I go to the sign in page
  And I enter an incorrect password for an already signed up user
  And I click "Log in"
  Then I should stay on the sign in page
  And I should see "Invalid Email or password."

