class CreateSurveyResults < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_results do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.integer :total_score, null: false
      t.timestamps
    end
    add_index :survey_results, [:survey_id, :users_id]
  end
end
