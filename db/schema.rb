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

ActiveRecord::Schema.define(version: 2021_03_05_144444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone_no"
    t.datetime "due_date"
    t.datetime "end_date"
    t.integer "loan_duration"
    t.decimal "installment_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "relationship_officer_id"
    t.text "loan_schedule", default: [], array: true
    t.string "status"
    t.index ["relationship_officer_id"], name: "index_clients_on_relationship_officer_id"
  end

  create_table "relationship_officers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_relationship_officers_on_email", unique: true
  end

  add_foreign_key "clients", "relationship_officers"
end
