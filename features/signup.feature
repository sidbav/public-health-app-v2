Feature: Application Signup

  As a patient
  I want to be able to create an account
  So that the application can gather the required information (Name, email, etc.).

Background: Users in database

  Given the following users exist:
  |gender | first_name | last_name | phone_number | address_line_1 | address_line_2 | zip   | city            | state        | date_of_birth | email              | password | confirmation_token   | confirmed_at               | confirmation_sent_at       |
  |Female | Test       | User      | 1231231234   | 123 Street     |                | 12345 | College Station | Texas        | 1999-01-01    | testuser@test.com  | Test123  | 7WqYzpezmQacMYjHuhgJ | 2023-02-21 21:19:16.346030 | 2023-02-21 21:16:57.180869 |
  |Female | Test       | User2     | 1231231234   | 123 Street     | APT 123        | 12345 | College Station | Texas        | 1999-01-01    | testuser2@test.com | Test123  | Hyde8H_jo63Gg42HdboD |                            | 2023-02-21 22:16:57.180869 |

Scenario: User Signup with Email Verification
  When I go to signup
    And I enter valid patient signup information
    And I click "Sign up" button
  Then I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
  When I open the email
  Then The subject of the email should be "Email Confirmation Instructions"
  When I click the confirmation link in the email
  Then I should be redirected to the login page with a flash message "Your email address has been successfully confirmed."

Scenario: A User Signed up but has not verified their email yet.
  Given I previously registered for an account using the email "testuser2@test.com" and did not verify my email
  When I go to signup
    And I click the "Didn't receive confirmation instructions?" hyperlink
    And I fill in "Email" with "testuser2@test.com"
    And I click "Resend confirmation instructions" button
  Then I should be redirected to login
    And  I should be redirected to the login page with a flash message "You will receive an email with instructions for how to confirm your email address in a few minutes."
  When I open the email
  Then The subject of the email should be "Email Confirmation Instructions"
  When I click the confirmation link in the email
  Then I should be redirected to the login page with a flash message "Your email address has been successfully confirmed."

Scenario: A User Cannot get another confirmation token
  Given I previously registered for an account using the email "testuser@test.com" and already verified my email
  When I go to signup
    And I click the "Didn't receive confirmation instructions?" hyperlink
    And I fill in "Email" with "testuser@test.com"
    And I click "Resend confirmation instructions" button
  Then I should see "Email was already confirmed, please try signing in"

Scenario: An email that was not previously registered cannot receive a confirmation token
  Given I previously did not register for an account with "not_a_user@test.com"
  When I go to signup
    And I click the "Didn't receive confirmation instructions?" hyperlink
    And I fill in "Email" with "not_a_user@test.com"
    And I click "Resend confirmation instructions" button
  Then I should see "Email not found"

Scenario: A user is on sign up page but clicks "Log in"
  When I go to signup
  And I click the "Log in" hyperlink
  Then I should see "Remember me"

Scenario: A user's password and password confirmation don't match
  When I go to signup
  And All fields until the Password and Password Confirmation are valid
  And I click "Sign up" button
  Then I should see "Password confirmation doesn't match Password"

Scenario: Email already taken
  When I go to signup
  And User enters an already taken email and all other fields are valid
  And I click "Sign up" button
  Then I should see "Email has already been taken"

Scenario: Password too long
  When I go to signup
  And All fields until the Password are valid and password is too long
  And I click "Sign up" button
  Then I should see "Password is too long"

Scenario: Password too short
  When I go to signup
  And All fields until the Password are valid and password is too short
  And I click "Sign up" button
  Then I should see "Password is too short"

Scenario: User logs in, then tries to sign up again
  When I go to the sign in page
  And I enter the correct email and password for a user who is signed up
  And I click "Log in"
  Then I should be redirected to the welcome page
  And I should see "Signed in successfully."
  Then I go to signup
  And I should see "You are already signed in"

Scenario: Phone number too long
  When I go to signup
  And All fields except phone number are correct
  And I enter a longer than allowed phone number
  And I click "Sign up" button
  Then I should see "Phone number is too long"

Scenario: Phone number too short
  When I go to signup
  And All fields except phone number are correct
  And I enter a shorter than allowed phone number
  And I click "Sign up" button
  Then I should see "Phone number is too short"

Scenario: Non-numerical phone number
  When I go to signup
  And All fields except phone number are correct
  And I enter a non-numerical phone number
  And I click "Sign up" button
  Then I should see "not a number"

Scenario: City with numbers
  When I go to signup
  And All fields except city are correct
  And I enter a city with numbers
  And I click "Sign up" button
  Then I should see "City is invalid"

Scenario: Current date minus date of birth is less than 18 years
  When I go to signup
  And All fields except date of birth are correct
  And Current date minus date of birth I entered is less than 18 years
  And I click "Sign up" button
  Then I should see "must be atleast 18 years"

Scenario: date of birth is before 1880
  When I go to signup
  And All fields except date of birth are correct
  And date of birth I entered is before 1880
  And I click "Sign up" button
  Then I should see "before 1880"

Scenario: date of birth is in the future
  When I go to signup
  And All fields except date of birth are correct
  And date of birth I entered is in the future
  And I click "Sign up" button
  Then I should see "in the future"

Scenario: email in incorrect format
  When I go to signup
  And All fields except email are correct
  And email is in incorrect format
  And I click "Sign up" button
  Then I should see "not a valid email"
