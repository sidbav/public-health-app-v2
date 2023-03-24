
Given /the following surveys exist/ do |surveys_table|
  surveys_table.hashes.each do |survey|
    languages = survey['languages'].split(',').map(&:strip)
    Survey.create survey.merge(languages: languages)
  end
end


#done
Given(/^I am not logged in$/) do
  if page.has_link?("Sign Out")
    click_link "Sign Out"
  end
end

#pending
Given(/^I am logged in$/) do
  unless page.has_link?("Sign Out")
    # code to log user in
    user = User.find_by(email: "testuser@test.com")
    visit "/users/sign_in"
    fill_in "user[email]", with: "testuser@test.com"
    fill_in "user[password]", with: "Test123"
    click_button 'Log in'
    expect(page).to have_link("Sign Out")
  end
end

#done
When(/^I visit the home screen$/) do
  # code to visit the home screen
  visit '/'
end

#done
Then(/^I should see the message "([^"]*)"$/) do |message|
  # code to check if message is displayed
  expect(page).to have_content(message)
end

#done
Then(/^I should see a link to fill out the survey$/) do
  # code to check if link is displayed
  expect(page).to have_link("Surveys", href: "/surveys")
end

#done
Then(/^I should see a table Surveys$/) do
  expect(page).to have_selector("div#surveys table")
end

#done
When(/^I click on the survey link$/) do
  # code to click on the survey link
  click_link("Survey")
end

Given (/^I am on survey page$/) do
  visit '/surveys'
end

When(/^I click on the "Take Survey" link on the first row$/) do
  within("table tbody tr:nth-child(1)") do
    click_on "Take Survey"
  end
end

Then(/^I should see the "English", "Spanish", and "Chinese" links$/) do
  expect(page).to have_link("English")
  expect(page).to have_link("Spanish")
  expect(page).to have_link("Chinese")
end
