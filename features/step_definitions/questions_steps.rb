# #require 'rails_helper'

Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create question
  end
end

# Given(/^I am not logged in$/) do
#   if page.has_link?("Sign Out")
#     click_link "Sign Out"
#   end
# end

# When(/^I visit question page$/) do
#   visit '/get_questions/'
# end

# Then (/^I should be able to see question$/) do
#   question = Question.first
#   expect(page).to have_content(question.question_text)
# end

# And (/^I should be able to see options$/)do
#   question = Question.first
#   expect(page).to have_content(question.options_list)
# end

# And (/^I should be able to see option$/)do
#   click_button "Submit"
# end

When("I am on language page") do
  survey = Survey.first # or use any other way to get a survey object
  visit select_language_survey_path(survey)
end

# When ("I am on language page") do
#   visit 'select_language'
# end

# # When("the user selects language") do
#   expect(page).to have_link(question.language)
# end

# When("the user selects language for question {string}") do |survey_id|
#   question = Question.find(survey_id)
#   expect(page).to have_link(question.language)
#   click_link(question.language)
# end
# When("the user selects language") do
#   click_link(question.language)
# end
When(/^the user selects language$/) do
  expect(page).to have_content('English,Spanish,Chinese')
end

Then("the user should be able to see the questions for survey") do
  expect(page).to have_content("Questions for Survey")
end
