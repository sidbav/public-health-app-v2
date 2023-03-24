# #require 'rails_helper'

Given /the following questions exist/ do |questions_table|
  questions_table.hashes.each do |question|
    Question.create question
  end
end


When("I click on the {string} link") do |language|
  click_link(language)
end

Then("I should be able to see the questions in English") do
  expect(page).to have_content("Do you have children under the age of 18 in your household?")
end

