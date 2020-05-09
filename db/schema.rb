# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_09_133318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "continents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.bigint "continent_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["continent_id"], name: "index_countries_on_continent_id"
  end

  create_table "data_covids", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.integer "total_cases"
    t.integer "new_cases"
    t.integer "total_deaths"
    t.integer "new_deaths"
    t.integer "total_recovered"
    t.integer "active_cases"
    t.integer "critical_cases"
    t.integer "total_cases_per_million"
    t.integer "deaths_per_million"
    t.integer "total_tests"
    t.integer "tests_per_million"
    t.datetime "data_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_data_covids_on_country_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "subscription", default: false
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "email_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_preferences_on_country_id"
    t.index ["email_id"], name: "index_preferences_on_email_id"
  end

  add_foreign_key "countries", "continents"
  add_foreign_key "data_covids", "countries"
  add_foreign_key "preferences", "countries"
  add_foreign_key "preferences", "emails"
end
