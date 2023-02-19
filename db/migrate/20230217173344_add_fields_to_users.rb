class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street_address, :string
    add_column :users, :apt_number, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :date
  end
end
