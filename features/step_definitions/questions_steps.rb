# #require 'rails_helper'

Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create question
  end
end


<<<<<<< HEAD
When("I click on the {string} link") do |language|
  click_link(language)
end

Then("I should be able to see the questions in English") do
  expect(page).to have_content("Do you have children under the age of 18 in your household?")
=======
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

When ("I am on language page") do
  # code to check if link is displayed
  expect(page).to have_link("languages", href: "/questions")
end

# When("I am on language page") do
#   survey = Survey.first # or use any other way to get a survey object
#   visit select_language_survey_path(survey)
# end

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
>>>>>>> 1c87355da8183ed96e51041cc65fee94ec3d9646
end

