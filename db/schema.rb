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

ActiveRecord::Schema.define(version: 2018_11_14_111128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id"
    t.bigint "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_events_on_field_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "field_type"
    t.string "availability"
    t.string "price"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["club_id"], name: "index_fields_on_club_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "phone_number"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.boolean "tennis", default: false
    t.boolean "padel", default: false
    t.boolean "squash", default: false
    t.string "tennis_level"
    t.string "padel_level"
    t.string "squash_level"
    t.string "photo"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "booked_from"
    t.date "booked_to"
    t.bigint "user_id"
    t.bigint "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_reservations_on_field_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "comment"
    t.bigint "user_id"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_reviews_on_club_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_player", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clubs", "users"
  add_foreign_key "events", "fields"
  add_foreign_key "events", "users"
  add_foreign_key "fields", "clubs"
  add_foreign_key "players", "users"
  add_foreign_key "reservations", "fields"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "clubs"
  add_foreign_key "reviews", "users"
end
