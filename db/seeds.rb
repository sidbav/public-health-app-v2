# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# survey1 = Survey.create(survey_name: "U.S. Household Food Security Survey", survey_category: "Food Security", languages: ['English', 'Spanish', 'Chinese'])
# survey2 = Survey.create(survey_name: "Six-Item Short Form of the Food Security Survey", survey_category: "Food Security", languages: ['English'])

#seed questions
#survey3 = Survey.create(survey_name: "Testing the Hide/Show Functionality", survey_category: "Testing Purposes!", languages: ['English'])

questions = [
  {
    survey_id: 3,
    language: "English",
    question_text: "Are you 18 years of age or older?",
    options_list: ["Yes", "No"],
    option_points_list: [1, 0],
    question_number: "1",
    has_parent_field: false,
    is_parent_of_field: "1A",
    option_selected_to_display_child: "Yes",
  },
  {
    survey_id: 3,
    language: "English",
    question_text: "You should only see this question if response was \"Yes\" to the previous question",
    options_list: ["Yea", "Maybe"],
    option_points_list: [2, 1, 0],
    question_number: "1A",
    has_parent_field: true,
  },
  {
    survey_id: 3,
    language: "English",
    question_text: "You should see this question anyways!",
    options_list: ["Yes I do", "No I dont"],
    option_points_list: [1, 0],
    question_number: "2",
    has_parent_field: false
  },
]

questions.each do |question|
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
