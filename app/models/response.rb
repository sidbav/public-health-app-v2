class Response < ApplicationRecord
  belongs_to :survey
  belongs_to :user

  def calculate_response_score
    question = Question.find_by(survey_id: survey_id, question_number: question_number)
    option_points_list = question.option_points_list
    option_points_hash = option_points_list.split(',').map { |str| str.split(':') }.to_h
    self.response_score = option_points_hash[response]
    save
  end
end
