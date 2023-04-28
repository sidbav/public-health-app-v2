require 'rails_helper'

RSpec.describe Response, type: :model do
  describe "Validations" do
  #   it "is valid with valid attributes" do
  #     survey = Survey.create(survey_name: "Test Survey")
  #     user = User.create(email: "test@example.com", password: "password", first_name: "John", last_name: "Doe")
  #     response = Response.new(survey_id: survey.id, user_id: user.id, response_score: 5)
  #     expect(response).to be_valid
  #   end

  #   it "is not valid without a survey_id" do
  #     user = User.create(email: "test@example.com", password: "password", first_name: "John", last_name: "Doe")
  #     response = Response.new(user_id: user.id, response_score: 5)
  #     expect(response).to_not be_valid
  #   end

  #   it "is not valid without a user_id" do
  #     survey = Survey.create(survey_name: "Test Survey")
  #     response = Response.new(survey_id: survey.id, response_score: 5)
  #     expect(response).to_not be_valid
  #   end

  #   it "is not valid without a response_score" do
  #     survey = Survey.create(survey_name: "Test Survey")
  #     user = User.create(email: "test@example.com", password: "password", first_name: "John", last_name: "Doe")
  #     response = Response.new(survey_id: survey.id, user_id: user.id)
  #     expect(response).to_not be_valid
  #   end
  # end

  # describe "Associations" do
  #   it { should belong_to(:survey) }
  #   it { should belong_to(:user) }
  # end

  # describe "Methods" do
  #   before do
  #     @survey = Survey.create(survey_name: "Test Survey")
  #     @user = User.create(email: "test@example.com", password: "password", first_name: "John", last_name: "Doe")
  #     @response = Response.new(survey_id: @survey.id, user_id: @user.id, response_score: 5)
  #   end

  #   it "returns the survey name" do
  #     expect(@response.survey_name).to eq(@survey.survey_name)
  #   end

  #   it "returns the user's full name" do
  #     expect(@response.user_name).to eq("John Doe")
  #   end
  end
end
