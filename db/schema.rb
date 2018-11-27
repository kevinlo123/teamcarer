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

ActiveRecord::Schema.define(version: 2018_11_27_211501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "team_name"
    t.text "team_statement"
    t.integer "team_id"
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
    t.index ["family_id"], name: "index_recipients_on_family_id"
  end

  create_table "teams", force: :cascade do |t|
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
    t.index ["confirmation_token"], name: "index_teams_on_confirmation_token", unique: true
    t.index ["email"], name: "index_teams_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teams_on_reset_password_token", unique: true
  end

  add_foreign_key "job_posts", "families"
  add_foreign_key "recipients", "families"
end
