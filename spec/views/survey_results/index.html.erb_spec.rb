require 'rails_helper'

RSpec.describe "survey_results/index", type: :view do
  before(:each) do
    assign(:survey_results, [
      SurveyResult.create!(),
      SurveyResult.create!()
    ])
  end

  it "renders a list of survey_results" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
