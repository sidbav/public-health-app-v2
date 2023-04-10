class Survey < ApplicationRecord
    has_many :survey_results
    has_many :responses
    has_many :survey_status
end
