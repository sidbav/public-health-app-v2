class AddTitleToSurveys < ActiveRecord::Migration[7.0]
  def change
    add_column :surveys, :title, :string
  end
end
