class ResponsesController < ApplicationController
    def index
        @survey = Survey.find(params[:survey_id])
        # debugger;
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
      total_score = 0

      answers_data.each do |answer|
        question_number = answer[1][0]
        puts question_number
        question = Question.find_by(survey_id: survey.id, question_number: question_number)

        # get the option_points_list and option_text_list for the question
        option_points_list = question.option_points_list
        option_index = answer[1][1]

        if !option_index.present?
          next
        else
          option_index = option_index.to_i
        end


        # get the response_score and response_option_number for the answer
        response_score = option_points_list[option_index]
        response_option_number = option_index

        # create a new Response object with the given attributes and save it to the database
        response = Response.new(survey_id: params[:survey_id], user_id: params[:user_id], question_number: question_number, response_score: response_score, response_option_number: response_option_number, time_submitted: response_time)
        response.save

        total_score += response_score
      end

      all_categories = Category.where(surveys_id: params[:survey_id])

      category_id = -1
      all_categories.each do |cat|
        if cat.low_score <= total_score && cat.high_score >= total_score
          category_id = cat.id
          break
        end
      end

      survey_result = SurveyResult.new(survey_id: params[:survey_id], users_id: params[:user_id], total_score: total_score, time_submitted: response_time, categories_id: category_id)
      survey_result.save

      render json: { success: true }
      # redirect_to '/surveys', notice: 'Responses saved successfully.'

    end

    private

    def response_params
      params.require(:response).permit(:survey_id, :user_id, :question_number, :response, :language, :category)
    end


  end
