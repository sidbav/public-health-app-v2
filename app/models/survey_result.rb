class SurveyResult < ApplicationRecord
    belongs_to :survey
    belongs_to :user
    has_many :responses
    has_many :results
    has_many :responses, through: :results
end
