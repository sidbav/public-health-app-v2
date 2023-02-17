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
  select "option1", :from => "user[state]"
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

And /I click "Sign up"/ do
  click_button "Sign up"
end

Then /I should be redirected to the welcome page/ do
  expect(current_path).to eq "/"
end

And /I should see "(.*)"/ do |message|
  expect(page).to have_content(message)
end
