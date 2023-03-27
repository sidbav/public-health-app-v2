class ModifyingQuestionsFields < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :question_dependency
    add_column :questions, :is_parent_of_field, :text, default: nil
    add_column :questions, :display_child_if_option_selected, :text, default: nil
  end
end
