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

ActiveRecord::Schema.define(version: 2021_01_05_090709) do

  create_table "feedbacks", force: :cascade do |t|
    t.integer "uid"
    t.text "body"
    t.integer "opening_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["opening_id"], name: "index_feedbacks_on_opening_id"
  end

  create_table "openings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "userid"
    t.integer "vacancy"
    t.text "checkpoint"
    t.text "serialno"
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer "uid"
    t.integer "opid"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "userdetails", force: :cascade do |t|
    t.integer "uuid"
    t.string "name"
    t.string "gender"
    t.integer "age"
    t.text "address"
    t.integer "pincode"
    t.integer "phone"
    t.integer "aadhaar"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.integer "usid"
    t.boolean "super", default: false
    t.string "cnfrmpass"
  end

  add_foreign_key "feedbacks", "openings"
end
