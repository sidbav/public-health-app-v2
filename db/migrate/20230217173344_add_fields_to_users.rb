class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :street_address, :text
    add_column :users, :apt_number, :text
    add_column :users, :city, :text
    add_column :users, :state, :text
    add_column :users, :zip, :text
    add_column :users, :phone_number, :text
    add_column :users, :date_of_birth, :date
  end
end
