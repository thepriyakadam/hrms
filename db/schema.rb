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

ActiveRecord::Schema.define(version: 20151130070825) do

  create_table "awards", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "award_name",  limit: 255
    t.text     "description", limit: 65535
    t.integer  "year",        limit: 4
    t.string   "award_from",  limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.string   "company_code",        limit: 255
    t.text     "description",         limit: 65535
    t.string   "name",                limit: 255
    t.integer  "company_type_id",     limit: 4
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
  end

  add_index "companies", ["company_type_id"], name: "index_companies_on_company_type_id", using: :btree
  add_index "companies", ["group_id"], name: "index_companies_on_group_id", using: :btree

  create_table "company_leavs", force: :cascade do |t|
    t.integer  "employee_grade_id", limit: 4
    t.integer  "leav_category_id",  limit: 4
    t.string   "no_of_leave",       limit: 255
    t.date     "expiry_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "company_leavs", ["employee_grade_id"], name: "index_company_leavs_on_employee_grade_id", using: :btree
  add_index "company_leavs", ["leav_category_id"], name: "index_company_leavs_on_leav_category_id", using: :btree

  create_table "company_locations", force: :cascade do |t|
    t.integer  "company_id",    limit: 4
    t.string   "location_code", limit: 255
    t.string   "name",          limit: 255
    t.string   "email",         limit: 255
    t.string   "address",       limit: 255
    t.string   "city",          limit: 255
    t.string   "district",      limit: 255
    t.integer  "pin_code",      limit: 4
    t.string   "contact_no",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "company_locations", ["company_id"], name: "index_company_locations_on_company_id", using: :btree

  create_table "company_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "custom_auto_increments", force: :cascade do |t|
    t.string   "counter_model_name", limit: 255
    t.integer  "counter",            limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_auto_increments", ["counter_model_name"], name: "index_custom_auto_increments_on_counter_model_name", using: :btree

  create_table "department_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer  "company_location_id", limit: 4
    t.string   "department_code",     limit: 255
    t.text     "description",         limit: 65535
    t.string   "name",                limit: 255
    t.integer  "department_type_id",  limit: 4
    t.string   "contact_no",          limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "departments", ["company_location_id"], name: "index_departments_on_company_location_id", using: :btree
  add_index "departments", ["department_type_id"], name: "index_departments_on_department_type_id", using: :btree

  create_table "employee_bank_details", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "account_no",  limit: 255
    t.string   "bank_name",   limit: 255
    t.string   "branch_name", limit: 255
    t.string   "address",     limit: 255
    t.string   "contact_no",  limit: 255
    t.string   "micr_code",   limit: 255
    t.string   "branch_code", limit: 255
    t.string   "ifsc_code",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employee_bank_details", ["employee_id"], name: "index_employee_bank_details_on_employee_id", using: :btree

  create_table "employee_grades", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employee_leav_balances", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.integer  "leav_category_id", limit: 4
    t.integer  "company_leav_id",  limit: 4
    t.string   "no_of_leave",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "employee_leav_balances", ["company_leav_id"], name: "index_employee_leav_balances_on_company_leav_id", using: :btree
  add_index "employee_leav_balances", ["employee_id"], name: "index_employee_leav_balances_on_employee_id", using: :btree
  add_index "employee_leav_balances", ["leav_category_id"], name: "index_employee_leav_balances_on_leav_category_id", using: :btree

  create_table "employee_leav_requests", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.integer  "leav_category_id", limit: 4
    t.string   "leave_type",       limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "date_range",       limit: 255
    t.integer  "no_of_day",        limit: 4
    t.decimal  "leave_count",                  precision: 5, scale: 1
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "employee_leav_requests", ["employee_id"], name: "index_employee_leav_requests_on_employee_id", using: :btree
  add_index "employee_leav_requests", ["leav_category_id"], name: "index_employee_leav_requests_on_leav_category_id", using: :btree

  create_table "employee_physicals", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "height",      limit: 255
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
    t.string   "employee_code",     limit: 255
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
    t.string   "handicap_type",     limit: 255
    t.string   "status",            limit: 255
    t.integer  "employee_type_id",  limit: 4
    t.string   "gender",            limit: 255
    t.string   "religion",          limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "employees", ["blood_group_id"], name: "index_employees_on_blood_group_id", using: :btree
  add_index "employees", ["department_id"], name: "index_employees_on_department_id", using: :btree
  add_index "employees", ["employee_code"], name: "index_employees_on_employee_code", using: :btree
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id", using: :btree
  add_index "employees", ["nationality_id"], name: "index_employees_on_nationality_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer  "employee_id",  limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description",  limit: 65535
    t.string   "no_of_year",   limit: 255
    t.string   "company_name", limit: 255
    t.string   "designation",  limit: 255
    t.string   "ctc",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "experiences", ["employee_id"], name: "index_experiences_on_employee_id", using: :btree

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
    t.string   "reference_from",    limit: 255
    t.string   "admin_hr",          limit: 255
    t.string   "tech_hr",           limit: 255
    t.string   "designation",       limit: 255
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

  create_table "leav_approveds", force: :cascade do |t|
    t.integer  "employee_leav_request_id", limit: 4
    t.datetime "approved_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "leav_approveds", ["employee_leav_request_id"], name: "index_leav_approveds_on_employee_leav_request_id", using: :btree

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
    t.string   "member_code",            limit: 255
    t.string   "subdomain",              limit: 255
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
  add_index "members", ["member_code"], name: "index_members_on_member_code", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "nationalities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "employee_id",  limit: 4
    t.string   "course",       limit: 255
    t.string   "college",      limit: 255
    t.string   "marks",        limit: 255
    t.integer  "passout_year", limit: 4
    t.string   "university",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "qualifications", ["employee_id"], name: "index_qualifications_on_employee_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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
  add_foreign_key "companies", "company_types"
  add_foreign_key "companies", "groups"
  add_foreign_key "company_leavs", "employee_grades"
  add_foreign_key "company_leavs", "leav_categories"
  add_foreign_key "company_locations", "companies"
  add_foreign_key "departments", "company_locations"
  add_foreign_key "departments", "department_types"
  add_foreign_key "employee_bank_details", "employees"
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
  add_foreign_key "experiences", "employees"
  add_foreign_key "families", "employees"
  add_foreign_key "families", "nationalities"
  add_foreign_key "joining_details", "employee_grades"
  add_foreign_key "joining_details", "employees"
  add_foreign_key "leav_approveds", "employee_leav_requests"
  add_foreign_key "leav_cancelleds", "employee_leav_requests"
  add_foreign_key "leav_rejecteds", "employee_leav_requests"
  add_foreign_key "qualifications", "employees"
  add_foreign_key "skillsets", "employees"
end
