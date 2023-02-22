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

ActiveRecord::Schema[7.0].define(version: 2023_02_22_223709) do
  create_table "questions", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.string "language", null: false
    t.string "question_text", null: false
    t.json "options_list", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id", "language"], name: "index_questions_on_survey_id_and_language", unique: true
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "survey_name", default: "", null: false
    t.string "survey_category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_name"], name: "index_surveys_on_survey_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "phone_number", null: false
    t.date "date_of_birth", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questions", "surveys"
end
