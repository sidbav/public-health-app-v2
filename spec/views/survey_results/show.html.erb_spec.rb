require 'rails_helper'

RSpec.describe "survey_results/show", type: :view do
  before(:each) do
    assign(:survey_result, SurveyResult.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
