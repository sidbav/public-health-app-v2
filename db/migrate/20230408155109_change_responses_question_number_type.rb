class ChangeResponsesQuestionNumberType < ActiveRecord::Migration[7.0]
  def change
    change_column :responses, :question_number, :text
  end
end
