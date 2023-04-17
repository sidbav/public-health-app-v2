class ChangeHasParentToParentQn < ActiveRecord::Migration[7.0]
  
  def change
    remove_column :questions, :has_parent_field, :boolean
    add_column :questions, :parent_question_number, :string, default: nil
    rename_column :questions, :is_parent_of_field, :child
  end
  
end
