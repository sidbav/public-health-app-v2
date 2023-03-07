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