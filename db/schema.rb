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

ActiveRecord::Schema.define(version: 20170417192938) do

  create_table "approvals", force: :cascade do |t|
    t.integer  "status"
    t.text     "comment"
    t.integer  "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_approvals_on_User_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "license"
    t.datetime "booking_time"
    t.datetime "start_slot"
    t.datetime "end_slot"
    t.datetime "start_time"
    t.datetime "end_time"
    t.float    "total_miles"
    t.float    "booking_rate"
    t.integer  "User_id"
    t.integer  "Car_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["Car_id"], name: "index_bookings_on_Car_id"
    t.index ["User_id"], name: "index_bookings_on_User_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string   "regnumber"
    t.string   "model"
    t.integer  "capacity"
    t.integer  "start_mileage"
    t.integer  "status"
    t.float    "curr_rate"
    t.string   "pickup_address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "license"
    t.string   "cardinfo"
    t.integer  "user_type"
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
