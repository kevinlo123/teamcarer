# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_10_102218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_givers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.string "phone"
    t.string "city"
    t.string "state"
    t.string "street"
    t.string "zip"
    t.integer "care_team_id"
    t.string "emergency_contact"
    t.string "emergency_number"
    t.string "companion_care", array: true
    t.string "personal_care", array: true
    t.string "languages", array: true
    t.string "conditions", array: true
    t.string "related_service", array: true
    t.boolean "dependable_car"
    t.boolean "physical_issues"
    t.boolean "tb_malaria"
    t.boolean "smoke"
    t.boolean "smoke_several_hours"
    t.boolean "drugs_alcohol"
    t.boolean "felonies"
    t.string "years_experience"
    t.boolean "authorized"
    t.text "statement"
    t.index ["confirmation_token"], name: "index_care_givers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_care_givers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_care_givers_on_reset_password_token", unique: true
  end

  create_table "care_teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "team_name"
    t.text "team_statement"
    t.integer "care_giver_id"
    t.index ["care_giver_id"], name: "index_care_teams_on_care_giver_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.string "city"
    t.string "phone"
    t.string "street"
    t.string "zip"
    t.string "state"
    t.string "emergency_name"
    t.string "emergency_contact"
    t.string "recipient_relation"
    t.index ["confirmation_token"], name: "index_families_on_confirmation_token", unique: true
    t.index ["email"], name: "index_families_on_email", unique: true
    t.index ["reset_password_token"], name: "index_families_on_reset_password_token", unique: true
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "taken"
    t.bigint "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "companion_care"
    t.string "recipient_gender"
    t.string "location"
    t.string "recipient_quality"
    t.string "family_contact"
    t.boolean "public", default: false
    t.string "recipient_conditions"
    t.index ["family_id"], name: "index_job_posts_on_family_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "family_id"
    t.string "primary_language"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "companion_care", array: true
    t.string "personal_care", array: true
    t.string "mobility", array: true
    t.string "conditions", array: true
    t.string "quality"
    t.boolean "recently_discharged"
    t.boolean "hospice"
    t.integer "hours_weekly"
    t.integer "months"
    t.index ["family_id"], name: "index_recipients_on_family_id"
  end

  add_foreign_key "job_posts", "families"
  add_foreign_key "recipients", "families"
end
