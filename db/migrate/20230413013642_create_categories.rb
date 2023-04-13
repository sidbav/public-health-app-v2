class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :surveys, null: false, foreign_key: true
      t.bigint :low_score, null: false
      t.bigint :high_score, null: false
      t.text :category, null: false, default: ''

      t.timestamps
    end
  end
end
