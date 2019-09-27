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

ActiveRecord::Schema.define(version: 20190927191824) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.date     "born"
    t.string   "sex"
    t.string   "email"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["sector_id"], name: "index_employees_on_sector_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.boolean  "open"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["name"], name: "index_questions_on_name"
  add_index "questions", ["open"], name: "index_questions_on_open"
  add_index "questions", [nil], name: "index_questions_on_compny_id"

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sectors", ["company_id"], name: "index_sectors_on_company_id"
  add_index "sectors", ["name"], name: "index_sectors_on_name"

  create_table "views", force: :cascade do |t|
    t.string   "ip"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "views", ["employee_id"], name: "index_views_on_employee_id"

end
