#require 'rails_helper'

Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create question
  end
end

Given(/^I am not logged in$/) do
  if page.has_link?("Sign Out")
    click_link "Sign Out"
  end
end

When(/^I visit question page$/) do
  visit '/get_questions/'
end

Then (/^I should be able to see question$/) do
  question = Question.first
  expect(page).to have_content(question.question_text)
end

And (/^I should be able to see options$/)do
  question = Question.first
  expect(page).to have_content(question.options_list)
end

And (/^I should be able to see option$/)do
  click_button "Submit"
end
