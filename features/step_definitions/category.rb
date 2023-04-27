  Given /^the following survey_results exist:$/ do |survey_results_table|
    survey_results_table.hashes.each do |survey_result|
      SurveyResult.create!(
        survey_id: survey_result[:survey_id],
        users_id: survey_result[:users_id],
        total_score: survey_result[:total_score],
        time_submitted: Time.parse(survey_result[:time_submitted]),
        categories_id: survey_result[:categories_id],
      )
    end
  end
  
  Given /^the following categories exist:$/ do |categories_table|
    categories_table.hashes.each do |category|
      Category.create!(
        surveys_id: category[:surveys_id],
        low_score: category[:low_score],
        high_score: category[:high_score],
        category: category[:category],
      )
    end
  end

  Then (/^I accept the alert$/) do
    page.evaluate_script('window.confirm =function() {return true;}')
    sleep(3)
  end

  When (/^I wait to get to survey screen$/) do
    visit "/surveys"
  end

  And /^I click on the "See Your Responses" link on third row$/ do
    within("table tbody tr:nth-child(3)") do
      click_on "See Your Responses"
    end
  end
  
  Then("I see Category {string}") do |category|
    expect(page).to have_css("p", text: /Category: .+/)
  end

  Then(/^I should not see any category displayed$/) do
    expect(page).not_to have_css(".category-display")
  end
  