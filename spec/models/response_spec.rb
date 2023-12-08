# require 'rails_helper'

# RSpec.describe Response, type: :model do
#   describe "Validations" do
#     it "is valid with valid attributes" do
#       survey = Survey.create(survey_name: "Test Survey")
#       user = User.create(email: "test@example.com", password: "password", first_name: "John", last_name: "Doe")
#       response = Response.new(survey_id: survey.id, user_id: user.id, response_score: 5)
#       expect(response).to be_valid
#     end

#     it "is not valid without a survey_id" do
#       user = User.create(email: "test@example.com", password: "password", first_name: "John", last_name: "Doe")
#       response = Response.new(user_id: user.id, response_score: 5)
#       expect(response).to_not be_valid
#     end

#     it "is not valid without a user_id" do
#       survey = Survey.create(survey_name: "Test Survey")
#       response = Response.new(survey_id: survey.id, response_score: 5)
#       expect(response).to_not be_valid
#     end

#     it "is not valid without a response_score" do
#       survey = Survey.create(survey_name: "Test Survey")
#       user = User.create(email: "test@example.com", password: "password", first_name: "John", last_name: "Doe")
#       response = Response.new(survey_id: survey.id, user_id: user.id)
#       expect(response).to_not be_valid
#     end
#   end

#   describe "Associations" do
#     it { should belong_to(:survey) }
#     it { should belong_to(:user) }
#   end

#   describe "Methods" do
#     before do
#       @survey = Survey.create(survey_name: "Test Survey")
#       @user = User.create(email: "test@example.com", password: "password", first_name: "John", last_name: "Doe")
#       @response = Response.new(survey_id: @survey.id, user_id: @user.id, response_score: 5)
#     end

#     it "returns the survey name" do
#       expect(@response.survey_name).to eq(@survey.survey_name)
#     end

#     it "returns the user's full name" do
#       expect(@response.user_name).to eq("John Doe")
#     end
#   end
# end

# RSpec.describe Resource, type: :model do
#   describe 'validations' do
#     it { should validate_presence_of(:title) }
#     it { should validate_presence_of(:description) }
#     it { should validate_presence_of(:url) }
#   end

#   describe 'associations' do
#     it { should belong_to(:category) }
#   end

#   describe 'search functionality' do
#     let!(:category) { Category.create(name: "Test Category") }
#     let!(:resource1) { Resource.create(title: "Test Resource 1", description: "A test resource 1", url: "https://www.example.com/resource1", category: category) }
#     let!(:resource2) { Resource.create(title: "Test Resource 2", description: "A test resource 2", url: "https://www.example.com/resource2", category: category) }

#     context 'when a query is provided' do
#       it 'returns resources that match the query' do
#         expect(Resource.search("Test Resource 1")).to include(resource1)
#         expect(Resource.search("Test Resource 1")).not_to include(resource2)
#       end
#     end
    
#     context 'when no query is provided' do
#       it 'returns all resources' do
#         expect(Resource.search(nil)).to include(resource1, resource2)
#         expect(Resource.search("")).to include(resource1, resource2)
#       end
#     end
#   end
# end
# spec/models/response_spec.rb

require 'rails_helper'

RSpec.describe Response, type: :model do
  describe "#calculate_response_score" do
    let!(:user) { User.create!(email: "test@example.com", password: "password", first_name: "Jane", last_name: "Doe", address_line_1: "123 Main St", city: "Dallas", state: "Texas", zip: "75001", phone_number: "5555555555", date_of_birth: "1990-01-01", gender: "Female") }
    let!(:survey) { Survey.create!(survey_name: "Test Survey", survey_category: "Category 1", languages: ["en"]) }
    let!(:question) { Question.create!(question_text: "Test Question", options_list: "Option 1,Option 2,Option 3,Option 4", option_points_list: "{1,2,3,4}", survey_id: survey.id, language: "en", question_number: 1) }
    let!(:response) { Response.create!(question_number: question.question_number, user_id: user.id, survey_id: survey.id, response_option_number: 1) }

    it "calculates the correct response score" do
      expect(response.calculate_response_score).to eq(1)
    end

    it "updates the response score in the database" do
      response.calculate_response_score
      expect(response.reload.response_score).to eq(1)
    end
  end
end
