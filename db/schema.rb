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

ActiveRecord::Schema.define(version: 20151116132432) do

  create_table "blood_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "group_id",            limit: 4
    t.string   "name",                limit: 255
    t.string   "registration_no",     limit: 255
    t.string   "pan_card_no",         limit: 255
    t.string   "tax_no",              limit: 255
    t.string   "professional_tax_no", limit: 255
    t.text     "address",             limit: 65535
    t.string   "city",                limit: 255
    t.string   "district",            limit: 255
    t.integer  "pin_code",            limit: 4
    t.string   "state",               limit: 255
    t.string   "email",               limit: 255
    t.string   "contact_no",          limit: 255
    t.string   "web_site",            limit: 255
    t.date     "starting_date"
    t.string   "ceo_name",            limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "company_type_id",     limit: 4
  end

  add_index "companies", ["company_type_id"], name: "index_companies_on_company_type_id", using: :btree
  add_index "companies", ["group_id"], name: "index_companies_on_group_id", using: :btree

  create_table "company_locations", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "district",   limit: 255
    t.integer  "pin_code",   limit: 4
    t.string   "contact_no", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "company_locations", ["company_id"], name: "index_company_locations_on_company_id", using: :btree

  create_table "company_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "department_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer  "company_location_id", limit: 4
    t.string   "name",                limit: 255
    t.string   "address",             limit: 255
    t.integer  "pin_code",            limit: 4
    t.string   "head_of_department",  limit: 255
    t.string   "contact_no",          limit: 255
    t.string   "manager",             limit: 255
    t.string   "hr",                  limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "department_type_id",  limit: 4
  end

  add_index "departments", ["company_location_id"], name: "index_departments_on_company_location_id", using: :btree
  add_index "departments", ["department_type_id"], name: "index_departments_on_department_type_id", using: :btree

  create_table "employee_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "department_id",     limit: 4
    t.string   "first_name",        limit: 255
    t.string   "middle_name",       limit: 255
    t.string   "last_name",         limit: 255
    t.date     "date_of_birth"
    t.string   "contact_no",        limit: 255
    t.string   "email",             limit: 255
    t.string   "permanent_address", limit: 255
    t.string   "city",              limit: 255
    t.string   "district",          limit: 255
    t.string   "state",             limit: 255
    t.integer  "pin_code",          limit: 4
    t.string   "current_address",   limit: 255
    t.string   "adhar_no",          limit: 255
    t.string   "pan_no",            limit: 255
    t.string   "licence_no",        limit: 255
    t.string   "passport_no",       limit: 255
    t.string   "marital_status",    limit: 255
    t.integer  "nationality_id",    limit: 4
    t.integer  "blood_group_id",    limit: 4
    t.string   "handicap",          limit: 255
    t.string   "status",            limit: 255
    t.integer  "employee_type_id",  limit: 4
    t.string   "gender",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "employees", ["blood_group_id"], name: "index_employees_on_blood_group_id", using: :btree
  add_index "employees", ["department_id"], name: "index_employees_on_department_id", using: :btree
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id", using: :btree
  add_index "employees", ["nationality_id"], name: "index_employees_on_nationality_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "subdomain",              limit: 255,              null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "groups", ["email"], name: "index_groups_on_email", unique: true, using: :btree
  add_index "groups", ["reset_password_token"], name: "index_groups_on_reset_password_token", unique: true, using: :btree
  add_index "groups", ["subdomain"], name: "index_groups_on_subdomain", unique: true, using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "account_id",             limit: 4
    t.string   "account_type",           limit: 255
  end

  add_index "members", ["account_type", "account_id"], name: "index_members_on_account_type_and_account_id", using: :btree
  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "nationalities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "companies", "groups"
  add_foreign_key "company_locations", "companies"
  add_foreign_key "departments", "company_locations"
  add_foreign_key "employees", "blood_groups"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "employee_types"
  add_foreign_key "employees", "nationalities"
end
