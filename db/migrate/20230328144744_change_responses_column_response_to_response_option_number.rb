class ChangeResponsesColumnResponseToResponseOptionNumber < ActiveRecord::Migration[7.0]
  def change
    change_table :responses do |t|
      t.remove :response
      t.integer :response_option_number
    end
  end
end
