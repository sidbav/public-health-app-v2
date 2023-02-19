class RenamingColumnsUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :street_address, :address_line_1
    rename_column :users, :apt_number, :address_line_2
  end
end
