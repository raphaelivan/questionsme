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

ActiveRecord::Schema.define(version: 20190928003402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asks", force: :cascade do |t|
    t.text     "description"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "asks", ["question_id"], name: "index_asks_on_question_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.date     "born"
    t.string   "sex"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "description"
    t.integer  "weight"
    t.integer  "ask_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["ask_id"], name: "index_options_on_ask_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "slug"
    t.string   "name"
    t.text     "description"
    t.boolean  "open"
    t.integer  "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["name"], name: "index_questions_on_name", using: :btree
  add_index "questions", ["open"], name: "index_questions_on_open", using: :btree
  add_index "questions", ["slug"], name: "index_questions_on_slug", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "email",      default: "", null: false
  end

  add_index "sectors", ["company_id"], name: "index_sectors_on_company_id", using: :btree
  add_index "sectors", ["email"], name: "index_sectors_on_email", using: :btree
  add_index "sectors", ["name"], name: "index_sectors_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "root",                   default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["root"], name: "index_users_on_root", using: :btree

  create_table "views", force: :cascade do |t|
    t.string   "ip"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "views", ["employee_id"], name: "index_views_on_employee_id", using: :btree

  add_foreign_key "asks", "questions"
  add_foreign_key "options", "asks"
  add_foreign_key "views", "employees"
end
