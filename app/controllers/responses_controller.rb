class ResponsesController < ApplicationController
    def index
        @survey = Survey.find(params[:survey_id])
        @latest_time_submitted = Response.maximum(:time_submitted)
        @responses = Response.where(survey_id: params[:survey_id], user_id: current_user.id, time_submitted: @latest_time_submitted)
        @language = params[:language] || "English"
        @questions = Question.where(survey_id: params[:survey_id], language: @language)
    end

    private

    def response_params
      params.require(:response).permit(:survey_id, :user_id, :question_number, :response, :language)
    end
  end