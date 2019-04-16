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

ActiveRecord::Schema.define(version: 2019_04_15_224414) do

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "country"
  end

  create_table "flight_events", force: :cascade do |t|
    t.datetime "time"
    t.boolean "is_departure"
    t.integer "destination_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_number"
    t.string "airline"
    t.integer "arrival_id"
    t.integer "departure_id"
    t.float "price"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.integer "destination_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
  end

  create_table "users_flights", force: :cascade do |t|
    t.integer "user_id"
    t.integer "flight_id"
  end

end
