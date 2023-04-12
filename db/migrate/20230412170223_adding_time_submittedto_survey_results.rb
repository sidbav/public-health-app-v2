class AddingTimeSubmittedtoSurveyResults < ActiveRecord::Migration[7.0]
  def change
    add_column :survey_results, :time_submitted, :datetime,  null: false
  end
end
