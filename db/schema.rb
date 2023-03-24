# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_23_021406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.text "language", null: false
    t.text "question_text", null: false
    t.text "options_list", null: false, array: true
    t.integer "option_points_list", null: false, array: true
    t.integer "question_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id", "language"], name: "index_questions_on_survey_id_and_language"
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.text "survey_name", default: "", null: false
    t.text "survey_category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "languages", null: false, array: true
    t.index ["survey_name"], name: "index_surveys_on_survey_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "email", default: "", null: false
    t.text "encrypted_password", default: "", null: false
    t.text "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.text "address_line_1", null: false
    t.text "address_line_2"
    t.text "city", null: false
    t.text "state", null: false
    t.text "zip", null: false
    t.text "phone_number", null: false
    t.date "date_of_birth", null: false
    t.text "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questions", "surveys"
end
