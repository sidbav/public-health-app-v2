class SurveyResult < ApplicationRecord
  belongs_to :survey
  attr_accessor :categories_id
  has_and_belongs_to_many :categories
end
