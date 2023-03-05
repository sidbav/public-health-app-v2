Feature: Application Sign in

  As a patient
  I want to log into the application
  So I can access the health surveys, gain access to resources and share the results of the surveys with my doctor.

Background: Users in database

  Given the following users exist:
  | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip   | city            | state        | date_of_birth | email                 | password | confirmation_token   | confirmed_at               | confirmation_sent_at       |
  | Test       | User      | 1231231234   | 123 Street     |                | 12345 | College Station | Texas        | 1999-01-01    | testuser@test.com     | Test123  | 123                  | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |
  | Not        | Confirmed | 1231231234   | 123 Street     |                | 12345 | College Station | Texas        | 1999-01-01    | notconfirmed@test.com | Test123  | 123                  |                            | 2023-02-21 21:16:57.180869 |

Scenario: Signed up users providing correct credentials can sign in
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

Scenario: Only Confirmed Users Can sign in
  When I go to the sign in page
  And I enter correct email and password for a not confirmed patient
  And I click "Log in"
  Then I should stay on the sign in page
  And I should see "You have to confirm your email address before continuing."