class AddHasParentFieldQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :has_parent_field, :boolean, default: false
  end
end
