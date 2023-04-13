class ResponsesController < ApplicationController
    def index
        @survey = Survey.find(params[:survey_id])
        @latest_time_submitted = Response.maximum(:time_submitted)
        @responses = Response.where(survey_id: params[:survey_id], user_id: current_user.id, time_submitted: @latest_time_submitted)
        @language = params[:language] || "English"
        if @responses.present?
          @questions = Question.where(survey_id: params[:survey_id], language: @language)
          @survey_results = SurveyResult.where(survey_id: params[:survey_id], users_id: current_user.id, time_submitted: @latest_time_submitted).first
          @category = Category.where(id: @survey_results[:categories_id]).first
        else
          @questions = nil
          @survey_results = nil
          @category = nil
        end
    end

    private

    def response_params
      params.require(:response).permit(:survey_id, :user_id, :question_number, :response, :language, :category)
    end
  end