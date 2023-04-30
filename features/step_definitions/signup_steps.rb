Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end

When /I go to signup/ do
  visit '/users/sign_up'
end

And /I enter valid patient signup information/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[email]", with: "first_last@gmail.com"
  fill_in "user[phone_number]", with: "1231231234"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  fill_in "user[city]", with: "Cool City"
  select "Male", :from => "user[gender]"
  select "Texas", :from => "user[state]"
  fill_in "user[date_of_birth]", with: "1999-01-01"
  fill_in "user[password]", with: "Test123"
  fill_in "user[password_confirmation]", with: "Test123"
end

And /I fill in "(.*)" with "(.*)"/ do |field, value|
  fill_in field, with:value
end

And /I select "(.*?)" for "(.*?)"/ do |option, selector|
  select option, :from => selector
end

And /I click "(.*)" button/ do |button|
  click_button button
end

Then /I should be redirected to the welcome page/ do
  expect(current_path).to eq "/"
end

And /I should see "(.*)"/ do |message|
  expect(page).to have_content(message)
end

# Passwords don't match
And /All fields until the Password and Password Confirmation are valid/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[email]", with: "first_last@gmail.com"
  fill_in "user[phone_number]", with: "1231231234"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  fill_in "user[city]", with: "Cool City"
  select "Texas", :from => "user[state]"
  select "Male", :from => "user[gender]"
  fill_in "user[date_of_birth]", with: "1999-01-01"
  fill_in "user[password]", with: "Test123"
  fill_in "user[password_confirmation]", with: "NotTest"
end

And /All fields until the Password are valid and password is too long/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[email]", with: "first_last@gmail.com"
  fill_in "user[phone_number]", with: "1231231234"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  fill_in "user[city]", with: "Cool City"
  select "Male", :from => "user[gender]"
  select "Texas", :from => "user[state]"
  fill_in "user[date_of_birth]", with: "1999-01-01"
  fill_in "user[password]", with: "Test123e28823929383929049292429409200298389293292893948493Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394"
  fill_in "user[password_confirmation]", with: "Test123e28823929383929049292429409200298389293292893948493Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394Test123e2882392938392904929242940920029838929329289394"
end

And /All fields until the Password are valid and password is too short/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[email]", with: "first_last@gmail.com"
  fill_in "user[phone_number]", with: "1231231234"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  fill_in "user[city]", with: "Cool City"
  select "Male", :from => "user[gender]"
  select "Texas", :from => "user[state]"
  fill_in "user[date_of_birth]", with: "1999-01-01"
  fill_in "user[password]", with: "h"
  fill_in "user[password_confirmation]", with: "h"
end

And /User enters an already taken email and all other fields are valid/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[email]", with: "testuser@test.com"
  fill_in "user[phone_number]", with: "1231231234"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  fill_in "user[city]", with: "Cool City"
  select "Male", :from => "user[gender]"
  select "Texas", :from => "user[state]"
  fill_in "user[date_of_birth]", with: "1999-01-01"
  fill_in "user[password]", with: "helloworld"
  fill_in "user[password_confirmation]", with: "helloworld"
end

And /I click the "(.*)" hyperlink/ do |link|
  click_link link
end

Given /I am on the confirmation page/ do
  user = User.last
  visit user_confirmation_path(confirmation_token: user.confirmation_token)
end

When /I open the email/ do
  open_email(ActionMailer::Base.deliveries.last.to.first)
end

Then /The subject of the email should be "(.*)"/ do |subject|
  expect(current_email.subject).to eq(subject)
end

When /I click the confirmation link in the email/ do
  visit_in_email 'Confirm my account'
end

Then /I should be redirected to the login page with a flash message "([^"]*)"/ do |message|
  expect(page).to have_current_path(new_user_session_path)
  expect(page).to have_content(message)
end

Given /I previously registered for an account using the email "(.*)" and did not verify my email/ do |email|
  user = User.find_by(email: email)
  expect(user).not_to eq(nil)
  expect(user.confirmed_at).to eq(nil)
end

Then /I should be redirected to login/ do
  expect(page).to have_current_path(new_user_session_path)
end

Given /I previously registered for an account using the email "(.*)" and already verified my email/ do |email|
  user = User.find_by(email: email)
  expect(user).not_to eq(nil)
  expect(user.confirmed_at).not_to eq(nil)
end

Given /I previously did not register for an account with "(.*)"/ do |email|
  user = User.find_by(email: email)
  expect(user).to eq(nil)
end

And /All fields except phone number are correct/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[email]", with: "tes9283ser@test.com"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  fill_in "user[city]", with: "Cool City"
  select "Male", :from => "user[gender]"
  select "Texas", :from => "user[state]"
  fill_in "user[date_of_birth]", with: "1999-01-01"
  fill_in "user[password]", with: "helloworld"
  fill_in "user[password_confirmation]", with: "helloworld"
end

And /I enter a longer than allowed phone number/ do
  fill_in "user[phone_number]", with: "1231231234190120921910912"
end

And /I enter a shorter than allowed phone number/ do
  fill_in "user[phone_number]", with: "123"
end

And /I enter a non-numerical phone number/ do
  fill_in "user[phone_number]", with: "92983298bek"
end

And /All fields except city are correct/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[email]", with: "tes9283ser@test.com"
  fill_in "user[phone_number]", with: "12312313322"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  select "Male", :from => "user[gender]"
  select "Texas", :from => "user[state]"
  fill_in "user[date_of_birth]", with: "1999-01-01"
  fill_in "user[password]", with: "helloworld"
  fill_in "user[password_confirmation]", with: "helloworld"
end

And /I enter a city with numbers/ do
  fill_in "user[city]", with: "Cool2o39City"
end


And /All fields except date of birth are correct/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[email]", with: "tes9283ser@test.com"
  fill_in "user[phone_number]", with: "12312313322"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  select "Male", :from => "user[gender]"
  select "Texas", :from => "user[state]"
  fill_in "user[city]", with: "Cool City"
  fill_in "user[password]", with: "helloworld"
  fill_in "user[password_confirmation]", with: "helloworld"
end

And /Current date minus date of birth I entered is less than 18 years/ do
  fill_in "user[date_of_birth]", with: "2020-01-01"
end

And /date of birth I entered is before 1880/ do
fill_in "user[date_of_birth]", with: "1830-01-01"
end

And /date of birth I entered is in the future/ do
  fill_in "user[date_of_birth]", with: "3298-01-01"
end

And /All fields except email are correct/ do
  fill_in "user[first_name]", with: "First"
  fill_in "user[last_name]", with: "Last"
  fill_in "user[phone_number]", with: "12312313322"
  fill_in "user[address_line_1]", with: "123 Street Drive"
  fill_in "user[address_line_2]", with: "APT 123"
  fill_in "user[zip]", with: "12345"
  select "Male", :from => "user[gender]"
  select "Texas", :from => "user[state]"
  fill_in "user[date_of_birth]", with: "1995-01-01"
  fill_in "user[city]", with: "Cool City"
  fill_in "user[password]", with: "helloworld"
  fill_in "user[password_confirmation]", with: "helloworld"
end

And /email is in incorrect format/ do
  fill_in "user[email]", with: "invalid@test981"
end