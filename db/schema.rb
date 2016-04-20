# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160420013248) do

  create_table "airports", force: :cascade do |t|
    t.integer  "airport_id"
    t.string   "code"
    t.string   "city"
    t.string   "country"
    t.string   "country_code"
    t.string   "continent"
    t.decimal  "coordinate_x", precision: 10, scale: 6
    t.decimal  "coordinate_y", precision: 10, scale: 6
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "selected_data", force: :cascade do |t|
    t.string   "departure_city"
    t.string   "departure_country"
    t.integer  "budget_min"
    t.integer  "budget_max"
    t.integer  "person_count"
    t.string   "currency"
    t.string   "month"
    t.string   "year"
    t.integer  "flight_duartion_min"
    t.integer  "flight_duration_max"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "itinerary_id"
    t.integer  "market_id"
    t.string   "brand"
    t.datetime "purchase_date"
    t.date     "departure_date"
    t.date     "return_date"
    t.string   "departure_city_tag"
    t.string   "departure_city"
    t.string   "departure_country"
    t.string   "departure_country_tag"
    t.string   "departure_continent"
    t.string   "destination_city_tag"
    t.string   "destination_city"
    t.string   "destination_country"
    t.string   "destination_country_tag"
    t.string   "destination_continent"
    t.decimal  "paid_amount"
    t.string   "paid_currency"
    t.decimal  "paid_amount_converted",   precision: 10, scale: 2
    t.string   "ticket_type"
    t.integer  "flight_duration"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

end
