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

ActiveRecord::Schema.define(version: 20180113134551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "babies", force: :cascade do |t|
    t.string "email", null: false
  end

  create_table "bath_logs", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.integer "duration_min", null: false
    t.datetime "started_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_bath_logs_on_baby_id"
  end

  create_table "breast_milk_logs", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.integer "duration_min", null: false
    t.integer "side", default: 0, null: false
    t.datetime "started_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_breast_milk_logs_on_baby_id"
  end

  create_table "milk_logs", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.integer "duration_min", null: false
    t.integer "milk_volume_ml", null: false
    t.datetime "started_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_milk_logs_on_baby_id"
  end

  create_table "pee_logs", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.integer "diaper_usage", default: 0, null: false
    t.datetime "started_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_pee_logs_on_baby_id"
  end

  create_table "poo_logs", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.integer "color", default: 0, null: false
    t.integer "diaper_usage", default: 0, null: false
    t.datetime "started_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_poo_logs_on_baby_id"
  end

  create_table "verification_codes", force: :cascade do |t|
    t.string "code", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_verification_codes_on_code", unique: true
  end

  add_foreign_key "bath_logs", "babies"
  add_foreign_key "breast_milk_logs", "babies"
  add_foreign_key "milk_logs", "babies"
  add_foreign_key "pee_logs", "babies"
  add_foreign_key "poo_logs", "babies"
end
