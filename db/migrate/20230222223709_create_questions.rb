class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :language, null: false
      t.string :question_text, null: false
      t.json :options_list, null:false
      t.timestamps
    end
    add_index :questions, [:survey_id, :language], unique: true
  end
end
