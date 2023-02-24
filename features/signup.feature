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

Scenario: A user is on sign up page but clicks "Log in"
  When I go to signup
  And I click the "Log in" hyperlink
  Then I should see "Remember me"

Scenario: A user's password and password confirmation don't match
  When I go to signup
  And All fields until the Password and Password Confirmation are valid
  And I click "Sign up"
  Then I should see "Password confirmation doesn't match Password"

Scenario: Email already taken
  When I go to signup
  And User enters an already taken email and all other fields are valid
  And I click "Sign up"
  Then I should see "Email has already been taken"

Scenario: Password too long
  When I go to signup
  And All fields until the Password are valid and password is too long
  And I click "Sign up"
  Then I should see "Password is too long"

Scenario: Password too short
  When I go to signup
  And All fields until the Password are valid and password is too short
  And I click "Sign up"
  Then I should see "Password is too short"

Scenario: User logs in, then tries to sign up again
  When I go to the sign in page
  And I enter the correct email and password for a user who is signed up
  And I click "Log in"
  Then I should be redirected to the welcome page
  And I should see "Signed in successfully."
  Then I go to signup
  And I should see "You are already signed in"