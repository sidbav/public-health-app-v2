class SurveyResult < ApplicationRecord
  belongs_to :survey
  attr_accessor :categories_id
end
