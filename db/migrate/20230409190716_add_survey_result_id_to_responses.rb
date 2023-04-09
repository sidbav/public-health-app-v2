class AddSurveyResultIdToResponses < ActiveRecord::Migration[7.0]
  def change
    add_reference :responses, :survey_result, null: false, foreign_key: true
  end
end
