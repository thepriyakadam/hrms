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

ActiveRecord::Schema.define(version: 20151126092647) do

  create_table "awards", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "award_name",  limit: 255
    t.integer  "year",        limit: 4
    t.string   "award_from",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "awards", ["employee_id"], name: "index_awards_on_employee_id", using: :btree

  create_table "blood_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "certifications", force: :cascade do |t|
    t.integer  "qualification_id", limit: 4
    t.string   "name",             limit: 255
    t.integer  "year",             limit: 4
    t.string   "duration",         limit: 255
    t.text     "descripation",     limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "certifications", ["qualification_id"], name: "index_certifications_on_qualification_id", using: :btree

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

  create_table "company_leavs", force: :cascade do |t|
    t.integer  "employee_grade_id", limit: 4
    t.string   "no_of_leave",       limit: 255
    t.date     "expire_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "leav_category_id",  limit: 4
  end

  add_index "company_leavs", ["employee_grade_id"], name: "index_company_leavs_on_employee_grade_id", using: :btree
  add_index "company_leavs", ["leav_category_id"], name: "index_company_leavs_on_leav_category_id", using: :btree

  create_table "company_locations", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
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
    t.string   "email",               limit: 255
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

  create_table "employee_grades", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employee_leav_balances", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.integer  "leav_category_id", limit: 4
    t.string   "no_of_leave",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "company_leav_id",  limit: 4
  end

  add_index "employee_leav_balances", ["company_leav_id"], name: "index_employee_leav_balances_on_company_leav_id", using: :btree
  add_index "employee_leav_balances", ["employee_id"], name: "index_employee_leav_balances_on_employee_id", using: :btree
  add_index "employee_leav_balances", ["leav_category_id"], name: "index_employee_leav_balances_on_leav_category_id", using: :btree

  create_table "employee_leav_requests", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.integer  "leav_category_id", limit: 4
    t.string   "leave_type",       limit: 255
    t.datetime "satrt_date"
    t.datetime "end_date"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "date_range",       limit: 255
    t.decimal  "leave_count",                  precision: 5, scale: 1
  end

  add_index "employee_leav_requests", ["employee_id"], name: "index_employee_leav_requests_on_employee_id", using: :btree
  add_index "employee_leav_requests", ["leav_category_id"], name: "index_employee_leav_requests_on_leav_category_id", using: :btree

  create_table "employee_physicals", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "hieght",      limit: 255
    t.string   "weight",      limit: 255
    t.string   "size",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employee_physicals", ["employee_id"], name: "index_employee_physicals_on_employee_id", using: :btree

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
    t.text     "permanent_address", limit: 65535
    t.string   "city",              limit: 255
    t.string   "district",          limit: 255
    t.string   "state",             limit: 255
    t.integer  "pin_code",          limit: 4
    t.text     "current_address",   limit: 65535
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
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "employees", ["blood_group_id"], name: "index_employees_on_blood_group_id", using: :btree
  add_index "employees", ["department_id"], name: "index_employees_on_department_id", using: :btree
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id", using: :btree
  add_index "employees", ["nationality_id"], name: "index_employees_on_nationality_id", using: :btree

  create_table "experinces", force: :cascade do |t|
    t.integer  "employee_id",          limit: 4
    t.string   "no_of_year_experince", limit: 255
    t.string   "company_name",         limit: 255
    t.string   "designation",          limit: 255
    t.string   "ctc",                  limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "experinces", ["employee_id"], name: "index_experinces_on_employee_id", using: :btree

  create_table "families", force: :cascade do |t|
    t.integer  "employee_id",       limit: 4
    t.string   "no_of_member",      limit: 255
    t.string   "f_name",            limit: 255
    t.string   "m_name",            limit: 255
    t.string   "l_name",            limit: 255
    t.date     "date_of_birth"
    t.integer  "age",               limit: 4
    t.string   "contact_no",        limit: 255
    t.string   "phone_no",          limit: 255
    t.string   "email",             limit: 255
    t.text     "permanent_address", limit: 65535
    t.string   "city",              limit: 255
    t.string   "dist",              limit: 255
    t.string   "state",             limit: 255
    t.integer  "pin_code",          limit: 4
    t.text     "current_address",   limit: 65535
    t.string   "relation",          limit: 255
    t.string   "adhar_no",          limit: 255
    t.string   "pan_no",            limit: 255
    t.string   "passport_no",       limit: 255
    t.string   "medical_claim",     limit: 255
    t.string   "marital",           limit: 255
    t.string   "status",            limit: 255
    t.integer  "nationality_id",    limit: 4
    t.string   "blood_group",       limit: 255
    t.string   "religion",          limit: 255
    t.string   "phandicap",         limit: 255
    t.string   "profession",        limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "families", ["employee_id"], name: "index_families_on_employee_id", using: :btree
  add_index "families", ["nationality_id"], name: "index_families_on_nationality_id", using: :btree

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

  create_table "joining_details", force: :cascade do |t|
    t.integer  "employee_id",       limit: 4
    t.date     "joining_date"
    t.string   "reffernce_from",    limit: 255
    t.string   "admin_hr",          limit: 255
    t.string   "tech_hr",           limit: 255
    t.string   "designation",       limit: 255
    t.string   "ctc",               limit: 255
    t.string   "account_no",        limit: 255
    t.integer  "employee_grade_id", limit: 4
    t.date     "confirmation_date"
    t.string   "status",            limit: 255
    t.string   "probation_period",  limit: 255
    t.string   "notice_period",     limit: 255
    t.string   "medical_schem",     limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "joining_details", ["employee_grade_id"], name: "index_joining_details_on_employee_grade_id", using: :btree
  add_index "joining_details", ["employee_id"], name: "index_joining_details_on_employee_id", using: :btree

  create_table "leav_aproveds", force: :cascade do |t|
    t.integer  "employee_leav_request_id", limit: 4
    t.datetime "approved_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "leav_aproveds", ["employee_leav_request_id"], name: "index_leav_aproveds_on_employee_leav_request_id", using: :btree

  create_table "leav_cancelleds", force: :cascade do |t|
    t.integer  "employee_leav_request_id", limit: 4
    t.datetime "cancelled_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "leav_cancelleds", ["employee_leav_request_id"], name: "index_leav_cancelleds_on_employee_leav_request_id", using: :btree

  create_table "leav_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "leav_rejecteds", force: :cascade do |t|
    t.integer  "employee_leav_request_id", limit: 4
    t.datetime "rejected_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "leav_rejecteds", ["employee_leav_request_id"], name: "index_leav_rejecteds_on_employee_leav_request_id", using: :btree

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

  create_table "qualifications", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.string   "ssc",                limit: 255
    t.string   "ssc_from",           limit: 255
    t.string   "ssc_marks",          limit: 255
    t.integer  "ssc_year",           limit: 4
    t.string   "ssc_bord",           limit: 255
    t.string   "diploma",            limit: 255
    t.string   "diploma_from",       limit: 255
    t.string   "diploma_marks",      limit: 255
    t.integer  "diploma_year",       limit: 4
    t.string   "diploma_university", limit: 255
    t.string   "hsc",                limit: 255
    t.string   "hsc_from",           limit: 255
    t.string   "hsc_marks",          limit: 255
    t.integer  "hsc_year",           limit: 4
    t.string   "hsc_bord",           limit: 255
    t.string   "ug",                 limit: 255
    t.string   "ug_from",            limit: 255
    t.string   "ug_marks",           limit: 255
    t.integer  "ug_year",            limit: 4
    t.string   "ug_university",      limit: 255
    t.string   "pg",                 limit: 255
    t.string   "pg_from",            limit: 255
    t.string   "pg_marks",           limit: 255
    t.integer  "pg_year",            limit: 4
    t.string   "pg_university",      limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "qualifications", ["employee_id"], name: "index_qualifications_on_employee_id", using: :btree

  create_table "skillsets", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "name",        limit: 255
    t.string   "skill_level", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "skillsets", ["employee_id"], name: "index_skillsets_on_employee_id", using: :btree

  add_foreign_key "awards", "employees"
  add_foreign_key "certifications", "qualifications"
  add_foreign_key "companies", "groups"
  add_foreign_key "company_leavs", "employee_grades"
  add_foreign_key "company_leavs", "leav_categories"
  add_foreign_key "company_locations", "companies"
  add_foreign_key "departments", "company_locations"
  add_foreign_key "employee_leav_balances", "company_leavs"
  add_foreign_key "employee_leav_balances", "employees"
  add_foreign_key "employee_leav_balances", "leav_categories"
  add_foreign_key "employee_leav_requests", "employees"
  add_foreign_key "employee_leav_requests", "leav_categories"
  add_foreign_key "employee_physicals", "employees"
  add_foreign_key "employees", "blood_groups"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "employee_types"
  add_foreign_key "employees", "nationalities"
  add_foreign_key "experinces", "employees"
  add_foreign_key "families", "employees"
  add_foreign_key "families", "nationalities"
  add_foreign_key "joining_details", "employee_grades"
  add_foreign_key "joining_details", "employees"
  add_foreign_key "leav_aproveds", "employee_leav_requests"
  add_foreign_key "leav_cancelleds", "employee_leav_requests"
  add_foreign_key "leav_rejecteds", "employee_leav_requests"
  add_foreign_key "qualifications", "employees"
  add_foreign_key "skillsets", "employees"
end
