# #require 'rails_helper'

Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create question
  end
end

When ("I am on language page") do
  visit '/select_language'
end

When(/^the user selects language$/) do
  expect(page).to have_content('English,Spanish,Chinese')
end

Then("the user should be able to see the questions for survey") do
  expect(page).to have_content("Questions for Survey")
end
