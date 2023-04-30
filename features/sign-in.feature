Feature: Application Sign in

  As a patient
  I want to log into the application
  So I can access the health surveys, gain access to resources and share the results of the surveys with my doctor.

Background: Users in database

  Given the following users exist:
  |gender | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip   | city            | state        | date_of_birth | email                 | password | confirmation_token   | confirmed_at               | confirmation_sent_at       |
  |Female | Test       | User      | 1231231234   | 123 Street     |                | 12345 | College Station | Texas        | 1999-01-01    | testuser@test.com     | Test123  | 123                  | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |
  |Female | Not        | Confirmed | 1231231234   | 123 Street     |                | 12345 | College Station | Texas        | 1999-01-01    | notconfirmed@test.com | Test123  | 123                  |                            | 2023-02-21 21:16:57.180869 |

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

Scenario: Non authenticated users should be redirected to the sign in page after accessing each resource
  Given I am not logged in
  When I visit home page
  Then I should be redirected to login
  When I visit survey page
  Then I should be redirected to login
  When I visit question page
  Then I should be redirected to login

Scenario: Forgot password feature for confirmed emails
  When I go to login
    And I click the "Forgot your password?" hyperlink
    And I enter a confirmed email
    And I click "Send me reset password instructions" button
  Then I should be redirected to the login page with a flash message "You will receive an email with instructions on how to reset your password in a few minutes."
  When I open the email
  Then The subject of the email should be "Reset password instructions"
  When I click the change my password link in the email
    And I enter a valid password
    And I click "Change my password" button
  Then I should be redirected to the home page with a flash message "Your password has been changed successfully. You are now signed in."

Scenario: Forgot password feature for non confirmed emails
  When I go to login
    And I click the "Forgot your password?" hyperlink
    And I enter a non confirmed email
    And I click "Send me reset password instructions" button
  Then I should see "Email not found"
    And I should see "Forgot your password?"

Scenario: Forgot password page hyperlinks
  Given I am on forgot password page
  When I click the "Log in" hyperlink
  Then I should see "Log in"
  When I click the "Sign up" hyperlink
  Then I should see "Sign up"
  When I click the "Didn't receive confirmation instructions?" hyperlink
  Then I should see "Resend confirmation instructions"
