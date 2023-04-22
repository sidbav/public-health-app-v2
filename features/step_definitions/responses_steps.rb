When /^I select Option "([^"]*)" for Question (\w+) for the (.*) Survey$/ do |option, question_id, survey_name|
  puts "##{question_id}"
  puts "#{option}, #{question_id}, #{survey_name}"
  # question_div = find("##{question_id}")
  # radio_button = within(question_div).find { |radio| radio.value == option }
  radio_button = page.all('input[type="radio"]').find { |radio| radio.value == option }
  radio_button.click
end


And(/^I click the Submit button$/) do
  debugger;
  click_button('submit-button')
end



Then(/^I should see an alert "([^"]*)"$/) do |alert_message|
  sleep(3)
  expect(page.driver.browser.switch_to.alert.text).to eq alert_message
  puts page.driver.browser.switch_to.alert.text
  page.driver.browser.switch_to.alert.accept
  sleep(3)
  visit '/'
  debugger;
end
  
  