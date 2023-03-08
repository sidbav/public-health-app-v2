class AddLanguagesToSurveys < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :languages, :text, array:true, null:false
  end
end