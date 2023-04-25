class CreateSearchItems < ActiveRecord::Migration[7.0]
  def change
    create_table :search_items do |t|
      t.string :category
      t.string :phrase

      t.timestamps
    end
  end
end
