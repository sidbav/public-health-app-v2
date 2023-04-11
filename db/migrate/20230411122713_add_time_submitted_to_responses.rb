class AddTimeSubmittedToResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :time_submitted, :datetime
  end
end
