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

ActiveRecord::Schema.define(version: 2021_04_02_190821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "relationship_officer_id"
    t.string "status"
    t.index ["relationship_officer_id"], name: "index_clients_on_relationship_officer_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.datetime "date"
    t.decimal "amount_due", precision: 10, scale: 2
    t.decimal "amount_collected", precision: 10, scale: 2
    t.integer "accounts_due"
    t.bigint "relationship_officer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["relationship_officer_id"], name: "index_metrics_on_relationship_officer_id"
  end

  create_table "relationship_officers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "activation_token"
    t.index ["email"], name: "index_relationship_officers_on_email", unique: true
  end

  create_table "short_loans", force: :cascade do |t|
    t.decimal "loan_amount", precision: 10, scale: 2
    t.decimal "initial_balance", precision: 10, scale: 2
    t.decimal "outstanding_loan_balance", precision: 10, scale: 2
    t.integer "loan_duration"
    t.decimal "instalment_amount", precision: 10, scale: 2
    t.text "loan_schedule", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "due_date"
    t.bigint "client_id"
    t.bigint "relationship_officer_id"
    t.index ["client_id"], name: "index_short_loans_on_client_id"
    t.index ["relationship_officer_id"], name: "index_short_loans_on_relationship_officer_id"
  end

  add_foreign_key "clients", "relationship_officers"
  add_foreign_key "metrics", "relationship_officers"
  add_foreign_key "short_loans", "clients"
  add_foreign_key "short_loans", "relationship_officers"
end
