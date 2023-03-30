class RenameDisplayChildIfOptionSelectedQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :display_child_if_option_selected, :option_selected_to_display_child
  end
end
