When /I go to the sign in page/ do
  visit "/users/sign_in"
end

And /I enter the correct email and password for a user who is signed up/ do
  fill_in "user[email]", with: "testuser@test.com"
  fill_in "user[password]", with: "Test123"
end

And /I enter an email for a user who is not signed up/ do
  fill_in "user[email]", with: "testuser@gmail.com"
  fill_in "user[password]", with: "Test123"
end

And /I enter an incorrect password for an already signed up user/ do
  fill_in "user[email]", with: "testuser@test.com"
  fill_in "user[password]", with: "test123"
end

And /I click "Log in"/ do
  click_button "Log in"
end

Then /I should stay on the sign in page/ do
  expect(current_path).to eq "/users/sign_in"
end

And /I enter correct email and password for a not confirmed patient/ do
  fill_in "user[email]", with: "notconfirmed@test.com"
  fill_in "user[password]", with: "Test123"
end

When(/^I visit home page$/) do
  visit '/'
end

When(/^I visit survey page$/) do
  visit '/surveys'
end

When(/^I visit question page$/) do
  visit '/questions'
end

When /I go to login/ do
  visit '/users/sign_in'
end

And /I enter a confirmed email/ do
  fill_in "user[email]", with: "testuser@test.com"
end

And /I enter a non confirmed email/ do
  fill_in "user[email]", with: "testuser2@test.com"
end

Given /I am on forgot password page/ do
  visit '/users/password/new'
end

When /I click the change my password link in the email/ do
  visit_in_email 'Change my password'
end

Then /I should be redirected to the change your password page/ do
  expect(page).to have_content("Change your password")
end

When /I enter a valid password/ do
  fill_in "user[password]", with: "Test123"
  fill_in "user[password_confirmation]", with: "Test123"
end

Then /I should be redirected to the home page with a flash message "(.*)"/ do |message|
  expect(page).to have_current_path("/")
  expect(page).to have_content(message)
end