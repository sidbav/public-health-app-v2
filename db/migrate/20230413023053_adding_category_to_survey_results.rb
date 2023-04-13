class AddingCategoryToSurveyResults < ActiveRecord::Migration[7.0]
  def change
    add_reference :survey_results, :categories, index: true, null:false
  end
end
