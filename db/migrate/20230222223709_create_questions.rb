class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :survey, null: false, foreign_key: true
      t.text :language, null: false
      t.text :question_text,  null: false
      t.text :options_list, array:true,  null:false
      t.integer :option_points_list, array:true,  null:false
      t.integer :question_number, null:false 
      t.timestamps
    end
    add_index :questions, [:survey_id, :language]
  end
end
