# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#seed users
user = User.new(
  email: 'user1@example.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'User1',
  last_name: 'User1',
  address_line_1: 'address',
  address_line_2: 'address',
  city: 'city',
  state: 'state',
  zip: '12345',
  phone_number: '1234567890',
  date_of_birth: Date.new(1990, 1, 1),
  confirmed_at: Time.now
)
user.skip_confirmation_notification! # Skip sending email confirmation
user.save!

user = User.new(
  email: 'user2@example.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'User2',
  last_name: 'User2',
  address_line_1: 'address',
  address_line_2: 'address',
  city: 'city',
  state: 'state',
  zip: '12345',
  phone_number: '1234567890',
  date_of_birth: Date.new(1990, 1, 1),
  confirmed_at: Time.now
)
user.skip_confirmation_notification! # Skip sending email confirmation
user.save!

user = User.new(
  email: 'user3@example.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: 'User3',
  last_name: 'User3',
  address_line_1: 'address',
  address_line_2: 'address',
  city: 'city',
  state: 'state',
  zip: '12345',
  phone_number: '1234567890',
  date_of_birth: Date.new(1990, 1, 1)
)
user.save!

#seed surveys
survey1 = Survey.create(survey_name: "U.S. Household Food Security Survey", survey_category: "Food Security", languages: ['English', 'Spanish', 'Chinese'])
survey2 = Survey.create(survey_name: "Six-Item Short Form of the Food Security Survey", survey_category: "Food Security", languages: ['English'])

survey2_questions = [
  {
    survey_id: 2,
    language: "English",
    question_text: "\"The food that (I/we) bought just didn't last, and (I/we) didn't have money to get more.\” Was that often, sometimes, or never true for (you/your household) in the last 12 months?",
    options_list: ["Often True","Sometimes True","Never True","Don't Know or Refused"],
    option_points_list: [1,1,0,0],
    question_number: "HH3",
    has_parent_field: false
  },
  {
    survey_id: 2,
    language: "English",
    question_text: "\"(I/we) couldn't afford to eat balanced meals.\" Was that often, sometimes, or never true for (you/your household) in the last 12 months?",
    options_list: ["Often True","Sometimes True","Never True","Don't Know or Refused"],
    option_points_list: [1,1,0,0],
    question_number: "HH4",
    has_parent_field: false
  },
  {
    survey_id: 2,
    language: "English",
    question_text: "In the last 12 months, since last (name of current month), did (you/you or other adults in your household) ever cut the size of your meals or skip meals because there wasn't\nenough money for food?",
    options_list: ["Yes","No","Don't Know"],
    option_points_list: [1,0,0],
    question_number: "AD1",
    is_parent_of_field: "AD1a",
    option_selected_to_display_child: "Yes",
    has_parent_field: false
  },
  {
    survey_id: 2,
    language: "English",
    question_text: "How often did this happen—almost every month, some months but not every month, or in only 1 or 2 months?",
    options_list: ["Almost Every Month","Some months but not every month","Only 1 month or 2 months","Don't Know"],
    option_points_list: [1,1,0,0],
    question_number: "AD1a",
    has_parent_field: true
  },
  {
    survey_id: 2,
    language: "English",
    question_text: "In the last 12 months, did you ever eat less than you felt you should because there wasn't\nenough money for food?",
    options_list: ["Yes","No","Don't Know"],
    option_points_list: [1,0,0],
    question_number: "AD2",
    has_parent_field: false
  },
  {
    survey_id: 2,
    language: "English",
    question_text: "In the last 12 months, were you every hungry but didn't eat because there wasn't enough money for food?",
    options_list: ["Yes","No","Don't Know"],
    option_points_list: [1,0,0],
    question_number: "AD3",
    has_parent_field: false
  }
]

survey2_questions.each do |question|
  Question.create!(
    survey_id: question[:survey_id],
    language: question[:language],
    question_text: question[:question_text],
    options_list: question[:options_list],
    option_points_list: question[:option_points_list],
    question_number: question[:question_number],
    has_parent_field: question[:has_parent_field],
    is_parent_of_field: question[:is_parent_of_field],
    option_selected_to_display_child: question[:option_selected_to_display_child],
  )
end

survey2_categories = [
  {
    low_score: 0,
    high_score: 0,
    category: "High Food Security",
  },
  {
    low_score: 1,
    high_score: 1,
    category: "Marginal Food Security",
  },
  {
    low_score: 2,
    high_score: 4,
    category: "Low Food Security",
  },
  {
    low_score: 5,
    high_score: 6,
    category: "Very Low Food Security",
  },
]

survey2_categories.each do |cat|
  Category.create!(
    surveys_id: survey2.id,
    low_score: cat[:low_score],
    high_score: cat[:high_score],
    category: cat[:category],
  )
end

user = User.first
time1 = Time.now

food_insecurce_responses = [
  {
    question_number: "HH3",
    response_option_number: 0,
    response_score: 1
  },
  {
    question_number: "HH4",
    response_option_number: 0,
    response_score: 1
  },
  {
    question_number: "AD1",
    response_option_number: 0,
    response_score: 1
  },
  {
    question_number: "AD1a",
    response_option_number: 0,
    response_score: 1
  },
  {
    question_number: "AD2",
    response_option_number: 0,
    response_score: 1
  },
  {
    question_number: "AD3",
    response_option_number: 0,
    response_score: 1
  },
]

food_insecurce_responses.each do |response|
  Response.create!(
    survey: survey2,
    user: user,
    question_number: response[:question_number],
    response_option_number: response[:response_option_number],
    response_score: response[:response_score],
    time_submitted: time1
  )
end

SurveyResult.create!(
  survey: survey2,
  users_id: user.id,
  total_score: 6,
  time_submitted: time1,
  categories_id: 4
)

user = User.second
food_securce_responses = [
  {
    question_number: "HH3",
    response_option_number: 2,
    response_score: 0
  },
  {
    question_number: "HH4",
    response_option_number: 2,
    response_score: 0
  },
  {
    question_number: "AD1",
    response_option_number: 1,
    response_score: 0
  },
  {
    question_number: "AD1a",
    response_option_number: 2,
    response_score: 0
  },
  {
    question_number: "AD2",
    response_option_number: 1,
    response_score: 0
  },
  {
    question_number: "AD3",
    response_option_number: 1,
    response_score: 0
  },
]

food_securce_responses.each do |response|
  Response.create!(
    survey: survey2,
    user: user,
    question_number: response[:question_number],
    response_option_number: response[:response_option_number],
    response_score: response[:response_score],
    time_submitted: time1
  )
end

SurveyResult.create!(
  survey: survey2,
  users_id: user.id,
  total_score: 0,
  time_submitted: time1,
  categories_id: 1
)
