class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.text :survey_name, null:false, default:""
      t.text :survey_category, null:false
      t.timestamps
    end
    add_index :surveys, :survey_name, unique: true

  end
end
