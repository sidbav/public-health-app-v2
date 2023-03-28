# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

 #survey1 = Survey.create(survey_name: "U.S. Household Food Security Survey", survey_category: "Food Security", languages: ['English', 'Spanish', 'Chinese'])
 #survey2 = Survey.create(survey_name: "Six-Item Short Form of the Food Security Survey", survey_category: "Food Security", languages: ['English'])

#seed questions
questions = [
  {
    survey_id: 1,
    language: "English",
    question_text: "Do you have children under the age of 18 in your household?",
    options_list: ["No", "Yes"],
    option_points_list: [0, 1],
    question_number: 1
  },
  {
    survey_id: 1,
    language: "English",
    question_text: "Which of these statements best describes the food eaten in your household in the last 12 months?",
    options_list: ["Enough of the kinds of food we want to eat", "Enough, but not always the kinds of food we want", "Sometimes not enough to eat", "Often not enough to eat", "I don't know, or I refuse to answer"],
    option_points_list: [0, 1, 2, 3, 4, 5],
    question_number: 2
  },
  {
    survey_id: 1,
    language: "Spanish",
    question_text: "Tiene hijos menores de 18 años en su hogar?",
    options_list: ["No", "Si"],
    option_points_list: [0, 1],
    question_number: 1
  },
  {
    survey_id: 1,
    language: "Spanish",
    question_text: "Cuál de las siguientes declaraciones describe mejor la situación alimentaria en su hogar en los últimos 12 meses?",
    options_list: ["Siempre comemos lo suficiente y los tipos de alimentos que deseamos", "Comemos lo suficiente pero no siempre lo que deseamos", "A veces no comemos lo suficiente", "Frecuentemente no comemos lo suficiente", "No sé, o me niego a responder"],
    option_points_list: [1, 2, 3, 4, 5],
    question_number: 2
  }
]

questions.each do |question|
  Question.create!(
    survey_id: question[:survey_id],
    language: question[:language],
    question_text: question[:question_text],
    options_list: question[:options_list],
    option_points_list: question[:option_points_list],
    question_number: question[:question_number]
  )
end

# seed resposes
survey = Survey.first
user = User.first

response1 = Response.create(
  survey: survey,
  user: user,
  question_number: 1,
  response: "Yes",
  response_score: 1
)

response2 = Response.create(
  survey: survey,
  user: user,
  question_number: 2,
  response: "Enough of the kinds of food we want to eat",
  response_score: 0
)