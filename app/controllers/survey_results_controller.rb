class SurveyResultsController < ApplicationController
  before_action :set_survey_result, only: %i[ show edit update destroy ]

  # GET /survey_results or /survey_results.json
  def index
    @survey_results = SurveyResult.all
  end

  # GET /survey_results/1 or /survey_results/1.json
  def show
  end

  # GET /survey_results/new
  def new
    @survey_result = SurveyResult.new
  end

  # GET /survey_results/1/edit
  def edit
  end

  # POST /survey_results or /survey_results.json
  def create
    @survey_result = SurveyResult.new(survey_result_params)

    respond_to do |format|
      if @survey_result.save
        format.html { redirect_to survey_result_url(@survey_result), notice: "Survey result was successfully created." }
        format.json { render :show, status: :created, location: @survey_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_results/1 or /survey_results/1.json
  def update
    respond_to do |format|
      if @survey_result.update(survey_result_params)
        format.html { redirect_to survey_result_url(@survey_result), notice: "Survey result was successfully updated." }
        format.json { render :show, status: :ok, location: @survey_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survey_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_results/1 or /survey_results/1.json
  def destroy
    @survey_result.destroy

    respond_to do |format|
      format.html { redirect_to survey_results_url, notice: "Survey result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_result
      @survey_result = SurveyResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_result_params
      params.fetch(:survey_result, {})
    end
end
