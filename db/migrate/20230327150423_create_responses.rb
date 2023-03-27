class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :question_number
      t.text :response
      t.integer :response_score

      t.timestamps
    end
  end
end
