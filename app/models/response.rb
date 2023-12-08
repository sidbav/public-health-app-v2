# app/models/response.rb

class Response < ApplicationRecord
  belongs_to :user
  belongs_to :survey

  def calculate_response_score
    question = Question.find_by(survey_id: survey_id, question_number: question_number)
    option_points = question.option_points_list
    self.response_score = option_points[response_option_number - 1]
    save
    response_score
  end
end
