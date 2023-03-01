# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

survey1 = Survey.create(survey_name: "U.S. Household Food Security Survey", survey_category: "Food Security", languages: ['English', 'Spanish', 'Chinese'])
survey2 = Survey.create(survey_name: "Six-Item Short Form of the Food Security Survey", survey_category: "Food Security", languages: ['English'])

