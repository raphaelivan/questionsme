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

  create_table "asks", force: :cascade do |t|
    t.text     "description"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "asks", ["question_id"], name: "index_asks_on_question_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.date     "born"
    t.string   "sex"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id"

  create_table "options", force: :cascade do |t|
    t.string   "description"
    t.integer  "weight"
    t.integer  "ask_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["ask_id"], name: "index_options_on_ask_id"

  create_table "questions", force: :cascade do |t|
    t.string   "slug"
    t.string   "name"
    t.text     "description"
    t.boolean  "open"
    t.integer  "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["name"], name: "index_questions_on_name"
  add_index "questions", ["open"], name: "index_questions_on_open"
  add_index "questions", ["slug"], name: "index_questions_on_slug"
  add_index "questions", [nil], name: "index_questions_on_compny_id"

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "email",      default: "", null: false
  end

  add_index "sectors", ["company_id"], name: "index_sectors_on_company_id"
  add_index "sectors", ["email"], name: "index_sectors_on_email"
  add_index "sectors", ["name"], name: "index_sectors_on_name"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "views", force: :cascade do |t|
    t.string   "ip"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "views", ["employee_id"], name: "index_views_on_employee_id"

end
