require 'rails_helper'

RSpec.describe "survey_results/edit", type: :view do
  let(:survey_result) {
    SurveyResult.create!()
  }

  before(:each) do
    assign(:survey_result, survey_result)
  end

  it "renders the edit survey_result form" do
    render

    assert_select "form[action=?][method=?]", survey_result_path(survey_result), "post" do
    end
  end
end
