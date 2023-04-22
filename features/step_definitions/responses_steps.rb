When /^I select Option "([^"]*)" for Question (\w+) for the (.*) Survey$/ do |option, question_id, survey_name|
  radio_button = page.all('input[type="radio"]').find { |radio| radio.value == option }
  radio_button.click
end

And(/^I click the Submit button$/) do
  click_button('submit-button')
end

Then(/^I should see an alert "([^"]*)"$/) do |alert_message|
  sleep(2)
  expect(page.driver.browser.switch_to.alert.text).to eq alert_message
  puts page.driver.browser.switch_to.alert.text
  page.driver.browser.switch_to.alert.accept
end
  
  