# #require 'rails_helper'

Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    options = question['options_list'].split(',').map(&:strip)
    options_points = question['option_points_list'].split(',').map(&:strip)
    Question.create!(
      survey_id: question[:survey_id],
      language: question[:language],
      question_text: question[:question_text],
      options_list: options,
      option_points_list: options_points,
      question_number: question[:question_number],
      child: question[:child] == '<null>' ? nil : question[:child],
      option_selected_to_display_child: question[:option_selected_to_display_child] == '<null>' ? nil : question[:option_selected_to_display_child],
      parent_question_number: question[:parent_question_number] == '<null>' ? nil : question[:parent_question_number],
    )
  end
end

When("I click on the {string} link") do |language|
  click_link(language)
end

Then("I should be able to see the questions in English") do
  expect(page).to have_content("Do you have children under the age of 18 in your household?")
end

When /^I click on the "Take Survey" link on the third row$/ do
  within("table tbody tr:nth-child(3)") do
    click_on "Take Survey"
  end
end

And /I should not see "(.*)"/ do |message|
  expect(page).not_to have_content(message)
end

# When /I select Option "(.*)" for Question 1 for the Testing the Hide\/Show Functionality Survey/ do |option|
#   radio_button = page.all('input[type="radio"]').find { |radio| radio.value == option }
#   radio_button.click
# end

