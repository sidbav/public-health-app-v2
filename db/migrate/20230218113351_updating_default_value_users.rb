class UpdatingDefaultValueUsers < ActiveRecord::Migration[7.0]
  def change
    # REQUIRED FIELDS
    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
    change_column_null(:users, :street_address, false)
    change_column_null(:users, :city, false)
    change_column_null(:users, :state, false)
    change_column_null(:users, :zip, false)
    change_column_null(:users, :phone_number, false)
    change_column_null(:users, :date_of_birth, false)

    # OPTIONAL FIELDS
    change_column_null(:users, :apt_number, true)
  end
end
