class AddScoreToResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :score, :integer
  end
end
