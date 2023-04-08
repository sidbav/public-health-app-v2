require 'rails_helper'

RSpec.describe "survey_results/new", type: :view do
  before(:each) do
    assign(:survey_result, SurveyResult.new())
  end

  it "renders new survey_result form" do
    render

    assert_select "form[action=?][method=?]", survey_results_path, "post" do
    end
  end
end
