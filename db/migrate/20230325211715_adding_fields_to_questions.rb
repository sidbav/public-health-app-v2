class AddingFieldsToQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :question_number, :text
    add_column :questions, :question_dependency, :text, default: nil
  end
end
