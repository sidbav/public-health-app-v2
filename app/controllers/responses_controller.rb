class ResponsesController < ApplicationController
    def index
        @survey = Survey.find(params[:survey_id])
        @latest_time_submitted = Response.where(user_id: current_user.id, survey_id: params[:survey_id]).maximum(:time_submitted)
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

    def create
      survey = Survey.find(params[:survey_id])
      user = User.find(params[:user_id])
      answers_data = params[:answers_data]
      response_time=Time.now
      answers_data.each do |answer|
        question_number = answer[1][0]
        puts question_number
        option_index = answer[1][1].to_i
        question = Question.find_by(survey_id: survey.id, question_number: question_number)
        
        # get the option_points_list and option_text_list for the question
        option_points_list = question.option_points_list
        
  
        # get the response_score and response_option_number for the answer
        response_score = option_points_list[option_index]
        response_option_number = option_index
  
        # create a new Response object with the given attributes and save it to the database
        response = Response.new(survey_id: params[:user_id], user_id: params[:user_id], question_number: question_number, response_score: response_score, response_option_number: response_option_number, time_submitted: response_time)
        response.save
      end
  
      # send a success response back to the client
      redirect_to '/surveys', notice: 'Responses saved successfully.'
      
    end

    private

    def response_params
      params.require(:response).permit(:survey_id, :user_id, :question_number, :response, :language, :category)
    end


  end
  