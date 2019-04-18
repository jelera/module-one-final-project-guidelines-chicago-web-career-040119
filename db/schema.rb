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

ActiveRecord::Schema.define(version: 2019_04_17_222008) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "country"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
    t.text "description"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_number"
    t.string "airline"
    t.float "price"
    t.boolean "is_departure_flight"
    t.integer "departure_city_id"
    t.datetime "departure_time"
    t.integer "arrival_city_id"
    t.datetime "arrival_time"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.integer "rating"
    t.integer "destination_id"
    t.integer "user_id"
  end

  create_table "user_flights", force: :cascade do |t|
    t.integer "user_id"
    t.integer "flight_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "address"
    t.string "email"
    t.string "password"
    t.string "country_origin"
  end

end
