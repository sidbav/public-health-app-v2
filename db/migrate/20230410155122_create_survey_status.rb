class CreateSurveyStatus < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_status do |t|
      t.references :user, null: false, foreign_key: true
      t.references :survey, null: false, foreign_key: true
      t.boolean :status
      t.date :date
      t.date :date_requested

      t.timestamps
    end
  end
end
