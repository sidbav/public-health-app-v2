class CreateLocalResources < ActiveRecord::Migration[7.0]
  def change
    create_table :local_resources do |t|
      t.text :zip, null: false
      t.text :name, null: false
      t.text :website
      t.text :address
      t.text :phone_number
      t.text :email

      t.timestamps
    end
  end
end
