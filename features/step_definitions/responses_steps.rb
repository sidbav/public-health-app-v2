When /^I select Option "([^"]*)" for Question (\d+) for the (.*) Survey$/ do |option, question_number, survey_name|
  question_div = find("##{question_number}")
  radio_button = question_div.find("label", text: option).find("input[type='radio']")
  radio_button.click
end

And(/^I click the Submit button$/) do
  click_button('submit-button')
end

Then(/^I should see a alert "([^"]*)"$/) do |alert_message|
  expect(page).to have_content(alert_message)
end