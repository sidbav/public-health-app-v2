class ResponsesController < ApplicationController
    def index
        @survey = Survey.find(params[:survey_id])
        @responses = Response.where(survey_id: params[:survey_id], user_id: params[:user_id])
    end
    
    def new
      @survey = Survey.find(params[:survey_id])
      @user = User.find(params[:user_id])
      @response = Response.new(survey: @survey, user: @user)
    end
  
    def create
      @response = Response.new(response_params)
      if @response.save
        @response.calculate_response_score
      else
        render :new
      end
    end
  
    def edit
      @response = Response.find(params[:id])
    end
  
    def update
      @response = Response.find(params[:id])
      if @response.update(response_params)
        @response.calculate_response_score
      else
        render :edit
      end
    end
  
    private
  
    def response_params
      params.require(:response).permit(:survey_id, :user_id, :question_number, :response)
    end
  end  