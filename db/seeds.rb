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
  zip: '77840',
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

  },
  {
    survey_id: 2,
    language: "English",
    question_text: "\"(I/we) couldn't afford to eat balanced meals.\" Was that often, sometimes, or never true for (you/your household) in the last 12 months?",
    options_list: ["Often True","Sometimes True","Never True","Don't Know or Refused"],
    option_points_list: [1,1,0,0],
    question_number: "HH4",

  },
  {
    survey_id: 2,
    language: "English",
    question_text: "In the last 12 months, since last (name of current month), did (you/you or other adults in your household) ever cut the size of your meals or skip meals because there wasn't\nenough money for food?",
    options_list: ["Yes","No","Don't Know"],
    option_points_list: [1,0,0],
    question_number: "AD1",
    child: "AD1a",
    option_selected_to_display_child: "Yes",

  },
  {
    survey_id: 2,
    language: "English",
    question_text: "How often did this happen—almost every month, some months but not every month, or in only 1 or 2 months?",
    options_list: ["Almost Every Month","Some months but not every month","Only 1 month or 2 months","Don't Know"],
    option_points_list: [1,1,0,0],
    question_number: "AD1a",
    parent_question_number: "AD1"
  },
  {
    survey_id: 2,
    language: "English",
    question_text: "In the last 12 months, did you ever eat less than you felt you should because there wasn't\nenough money for food?",
    options_list: ["Yes","No","Don't Know"],
    option_points_list: [1,0,0],
    question_number: "AD2",

  },
  {
    survey_id: 2,
    language: "English",
    question_text: "In the last 12 months, were you every hungry but didn't eat because there wasn't enough money for food?",
    options_list: ["Yes","No","Don't Know"],
    option_points_list: [1,0,0],
    question_number: "AD3",

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
    parent_question_number: question[:parent_question_number],
    child: question[:child],
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

user = User.second


local_resource_BCS = [
  {
    name: "Islamic Community of Bryan/College Station (ICBCS)",
    website: "https://www.icbcs.org/",
    address: "417 Stasney St, College Station, TX 77840",
    email: "board@icbcs.org"
  },
  {
    name: "A&M United Methodist Church",
    website: "https://www.am-umc.org/",
    address: "417 University Drive, College Station, TX 77840, USA",
    phone_number: "979-846-8731",
    email: "office@am-umc.org",
  },
  {
    name: "ANTIOCH COMMUNITY CHURCH",
    website: "https://www.antiochcs.org/",
    address: "1803 BRIARCREST DR, BRYAN, TX 77802, USA",
    phone_number: "(979)703-8411",
    email: "INFO@ANTIOCHCS.ORG",
  },
  {
    name: "BRAZOS FELLOWSHIP",
    website: "https://brazosfellowship.com/",
    address: "226 Southwest Pkwy E, College Station, TX 77840",
    phone_number: "979.680.8888",
    email: "email@brazosfellowship.com",
  },
  {
    name: "CENTERAL CHURCH",
    website: "https://centralbcs.org/",
    address: "1991 FM 158, COLLEGE STATION, TX US 77845",
    phone_number: "979.776.9977"
  },
  {
    name: "Christ Chruch",
    website: "https://www.christchurchcs.org/",
    address: "4201 State Highway 6 South, College Station, TX 77845",
    phone_number: "979.690.4673"
  },
  {
    name: "Shri Omkarnath Temple",
    website: "http://hsbv.org/",
    address: "23,300 State Hwy. 6 South, Navasota, TX 77868",
    phone_number: "(979) 307-0304",
    email: "hsbv.pres@gmail.com"
  },
  {
    name: "Congregation Beth Shalom",
    website: "https://cbsbcs.org/",
    address: "101 North Coulter Drive Bryan, TX 77803",
    phone_number: "(979) 822-2738"
  },
]

BCS_ZipCodes = [ "77840", "77841", "77842", "77843", "77845"]

BCS_ZipCodes.each do |zip|
  local_resource_BCS.each do |resource|
    LocalResource.create!(
      zip: zip,
      name: resource[:name],
      website: resource[:website],
      address: resource[:address],
      phone_number: resource[:phone_number],
      email: resource[:email],
    )
  end
end

