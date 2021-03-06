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

ActiveRecord::Schema.define(version: 2019_05_15_124524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_members", force: :cascade do |t|
    t.bigint "band_id"
    t.bigint "musician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_members_on_band_id"
    t.index ["musician_id"], name: "index_band_members_on_musician_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "band_name", null: false
    t.string "scene", null: false
    t.string "genre"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bandcamp_embedded"
    t.string "band_photo"
  end

  create_table "gigs", force: :cascade do |t|
    t.string "address", null: false
    t.float "gig_lat", null: false
    t.float "gig_long", null: false
    t.datetime "date", null: false
    t.bigint "band_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gig_photo"
    t.index ["band_id"], name: "index_gigs_on_band_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "home_town"
    t.string "email", null: false
    t.string "scene", null: false
    t.string "instruments", null: false
    t.text "bio"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "musician_state", default: "closed"
    t.index ["user_id"], name: "index_musicians_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
