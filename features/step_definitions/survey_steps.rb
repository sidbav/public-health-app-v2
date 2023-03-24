# Given /the following surveys exist/ do |surveys_table|
#   surveys_table.hashes.each do |survey|
#     Survey.create survey
#   end
# end
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

# #done
# When(/^I click on the "Take Survey" link in row (\d+)$/) do |survey_number|
#   # code to click on the "Take Survey" link in the specified row
#   row = all('table tr')[survey_number.to_i]
#   within(row) do
#     click_link("Take Survey")
#   end
# end

# When(/^I click on the take survey on row (\d+)$/) do |row_number|
#   within("table tr:nth-child(#{row_number}) td:first-child") do
#     click_link "Take Survey"
#   end
# end

# When(/^I click on the take survey on any row/) do |row_number|
#   row = all('table tr')[row_number.to_i]
#   within(row) do
#     click_link "Take Survey"
#   end
# end
# When(/^I click on the take survey on any row$/) do
#   if page.has_css?("#surveys table tbody tr:first-child td:last-child a", text: "Take Survey")
#     within("#surveys table tbody tr:first-child") do
#       click_link "Take Survey"
#     end
#   else
#     raise "No survey table found on page"
#   end
# end


Then(/^I should see (\d+) links to choose/) do |num_links|
  expect(page).to have_selector('a.choice-link', count: num_links)
end

Then(/^"I should see "English", "Spanish", "Chinese"/) do |link1, link2, link3|
  expect(page).to have_link(link1)
  expect(page).to have_link(link2)
  expect(page).to have_link(link3)
end