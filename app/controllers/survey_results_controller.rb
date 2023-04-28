class SurveyResultsController < ApplicationController
  before_action :set_survey_result, only: %i[ show edit update destroy ]

#   private
#     # Only allow a list of trusted parameters through.
#     def survey_result_params
#       params.fetch(:survey_result, {})
#     end
end
