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

ActiveRecord::Schema.define(version: 20151218151044) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "employee_shift_id"
    t.integer  "employee_id"
    t.string   "attendance_date"
    t.time     "check_in"
    t.time     "check_out"
    t.decimal  "company_hrs"
    t.decimal  "over_time_hrs"
    t.decimal  "total_hrs"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "attendances", ["employee_id"], name: "index_attendances_on_employee_id"
  add_index "attendances", ["employee_shift_id"], name: "index_attendances_on_employee_shift_id"

  create_table "awards", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "award_name"
    t.text     "description"
    t.integer  "year_id"
    t.string   "award_from"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "awards", ["employee_id"], name: "index_awards_on_employee_id"
  add_index "awards", ["year_id"], name: "index_awards_on_year_id"

  create_table "blood_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifications", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "year_id"
    t.string   "name"
    t.string   "duration"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "certifications", ["employee_id"], name: "index_certifications_on_employee_id"
  add_index "certifications", ["year_id"], name: "index_certifications_on_year_id"

  create_table "companies", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "manual_company_code"
    t.string   "company_code"
    t.text     "description"
    t.string   "name"
    t.integer  "company_type_id"
    t.string   "registration_no"
    t.string   "pan_card_no"
    t.string   "tax_no"
    t.string   "professional_tax_no"
    t.text     "address"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "district_id"
    t.string   "city"
    t.integer  "pin_code"
    t.string   "email"
    t.string   "contact_no"
    t.string   "web_site"
    t.date     "starting_date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "companies", ["company_type_id"], name: "index_companies_on_company_type_id"
  add_index "companies", ["country_id"], name: "index_companies_on_country_id"
  add_index "companies", ["district_id"], name: "index_companies_on_district_id"
  add_index "companies", ["group_id"], name: "index_companies_on_group_id"
  add_index "companies", ["state_id"], name: "index_companies_on_state_id"

  create_table "company_leavs", force: :cascade do |t|
    t.integer  "employee_grade_id"
    t.integer  "leav_category_id"
    t.string   "no_of_leave"
    t.date     "expiry_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "company_leavs", ["employee_grade_id"], name: "index_company_leavs_on_employee_grade_id"
  add_index "company_leavs", ["leav_category_id"], name: "index_company_leavs_on_leav_category_id"

  create_table "company_locations", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "manual_company_location_code"
    t.string   "location_code"
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "district_id"
    t.integer  "pin_code"
    t.string   "contact_no"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "company_locations", ["company_id"], name: "index_company_locations_on_company_id"
  add_index "company_locations", ["country_id"], name: "index_company_locations_on_country_id"
  add_index "company_locations", ["district_id"], name: "index_company_locations_on_district_id"
  add_index "company_locations", ["state_id"], name: "index_company_locations_on_state_id"

  create_table "company_shifts", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.string   "in_time"
    t.string   "out_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "company_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cost_centers", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_auto_increments", force: :cascade do |t|
    t.string   "counter_model_name"
    t.integer  "counter",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_auto_increments", ["counter_model_name"], name: "index_custom_auto_increments_on_counter_model_name"

  create_table "degree_streams", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "degree_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "department_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer  "company_location_id"
    t.string   "manual_department_code"
    t.string   "department_code"
    t.text     "description"
    t.string   "name"
    t.integer  "department_type_id"
    t.string   "contact_no"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "departments", ["company_location_id"], name: "index_departments_on_company_location_id"
  add_index "departments", ["department_type_id"], name: "index_departments_on_department_type_id"

  create_table "districts", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["state_id"], name: "index_districts_on_state_id"

  create_table "employee_bank_details", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "account_no"
    t.string   "bank_name"
    t.string   "branch_name"
    t.string   "address"
    t.string   "contact_no"
    t.string   "micr_code"
    t.string   "branch_code"
    t.string   "ifsc_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employee_bank_details", ["employee_id"], name: "index_employee_bank_details_on_employee_id"

  create_table "employee_designations", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employee_grades", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employee_leav_balances", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "leav_category_id"
    t.integer  "company_leav_id"
    t.string   "no_of_leave"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "employee_leav_balances", ["company_leav_id"], name: "index_employee_leav_balances_on_company_leav_id"
  add_index "employee_leav_balances", ["employee_id"], name: "index_employee_leav_balances_on_employee_id"
  add_index "employee_leav_balances", ["leav_category_id"], name: "index_employee_leav_balances_on_leav_category_id"

  create_table "employee_leav_requests", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "leav_category_id"
    t.string   "leave_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "date_range"
    t.integer  "no_of_day"
    t.decimal  "leave_count",      precision: 5, scale: 1
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "employee_leav_requests", ["employee_id"], name: "index_employee_leav_requests_on_employee_id"
  add_index "employee_leav_requests", ["leav_category_id"], name: "index_employee_leav_requests_on_leav_category_id"

  create_table "employee_physicals", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "height"
    t.string   "weight"
    t.string   "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employee_physicals", ["employee_id"], name: "index_employee_physicals_on_employee_id"

  create_table "employee_shifts", force: :cascade do |t|
    t.integer  "company_shift_id"
    t.integer  "employee_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "employee_shifts", ["company_shift_id"], name: "index_employee_shifts_on_company_shift_id"
  add_index "employee_shifts", ["employee_id"], name: "index_employee_shifts_on_employee_id"

  create_table "employee_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "manual_employee_code"
    t.string   "employee_code"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "contact_no"
    t.string   "optinal_contact_no"
    t.string   "email"
    t.text     "permanent_address"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "district_id"
    t.string   "city"
    t.integer  "pin_code"
    t.text     "current_address"
    t.string   "adhar_no"
    t.string   "pan_no"
    t.string   "licence_no"
    t.string   "marital_status"
    t.integer  "nationality_id"
    t.integer  "blood_group_id"
    t.string   "handicap"
    t.string   "handicap_type"
    t.string   "status"
    t.integer  "employee_type_id"
    t.string   "gender"
    t.string   "religion"
    t.integer  "manager_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "employees", ["blood_group_id"], name: "index_employees_on_blood_group_id"
  add_index "employees", ["country_id"], name: "index_employees_on_country_id"
  add_index "employees", ["department_id"], name: "index_employees_on_department_id"
  add_index "employees", ["district_id"], name: "index_employees_on_district_id"
  add_index "employees", ["employee_code"], name: "index_employees_on_employee_code"
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id"
  add_index "employees", ["manager_id"], name: "index_employees_on_manager_id"
  add_index "employees", ["nationality_id"], name: "index_employees_on_nationality_id"
  add_index "employees", ["state_id"], name: "index_employees_on_state_id"

  create_table "experiences", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.string   "no_of_year"
    t.string   "company_name"
    t.string   "designation"
    t.string   "ctc"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "experiences", ["employee_id"], name: "index_experiences_on_employee_id"

  create_table "families", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "no_of_member"
    t.string   "f_name"
    t.string   "m_name"
    t.string   "l_name"
    t.date     "date_of_birth"
    t.integer  "age"
    t.string   "contact_no"
    t.string   "email"
    t.text     "current_address"
    t.string   "relation"
    t.string   "adhar_no"
    t.string   "pan_no"
    t.string   "have_passport"
    t.string   "passport_no"
    t.date     "passport_issue_date"
    t.date     "passport_expiry_date"
    t.string   "medical_claim"
    t.string   "marital"
    t.string   "religion"
    t.string   "is_handicap"
    t.string   "handicap_type"
    t.string   "profession"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "gender"
    t.integer  "blood_group_id"
  end

  add_index "families", ["blood_group_id"], name: "index_families_on_blood_group_id"
  add_index "families", ["employee_id"], name: "index_families_on_employee_id"

  create_table "groups", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "subdomain",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "groups", ["email"], name: "index_groups_on_email", unique: true
  add_index "groups", ["reset_password_token"], name: "index_groups_on_reset_password_token", unique: true
  add_index "groups", ["subdomain"], name: "index_groups_on_subdomain", unique: true

  create_table "joining_details", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "joining_date"
    t.string   "designation"
    t.integer  "employee_grade_id"
    t.integer  "employee_designation_id"
    t.date     "confirmation_date"
    t.string   "status"
    t.string   "probation_period"
    t.string   "notice_period"
    t.boolean  "is_mediclaim"
    t.string   "medical_schem"
    t.string   "have_passport"
    t.string   "passport_no"
    t.date     "passport_issue_date"
    t.date     "passport_expiry_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "joining_details", ["employee_designation_id"], name: "index_joining_details_on_employee_designation_id"
  add_index "joining_details", ["employee_grade_id"], name: "index_joining_details_on_employee_grade_id"
  add_index "joining_details", ["employee_id"], name: "index_joining_details_on_employee_id"

  create_table "leav_approveds", force: :cascade do |t|
    t.integer  "employee_leav_request_id"
    t.datetime "approved_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "leav_approveds", ["employee_leav_request_id"], name: "index_leav_approveds_on_employee_leav_request_id"

  create_table "leav_cancelleds", force: :cascade do |t|
    t.integer  "employee_leav_request_id"
    t.datetime "cancelled_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "leav_cancelleds", ["employee_leav_request_id"], name: "index_leav_cancelleds_on_employee_leav_request_id"

  create_table "leav_categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "leav_rejecteds", force: :cascade do |t|
    t.integer  "employee_leav_request_id"
    t.datetime "rejected_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "leav_rejecteds", ["employee_leav_request_id"], name: "index_leav_rejecteds_on_employee_leav_request_id"

  create_table "members", force: :cascade do |t|
    t.string   "manual_member_code"
    t.integer  "role_id"
    t.string   "member_code"
    t.string   "subdomain"
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "company_id"
    t.integer  "company_location_id"
    t.integer  "department_id"
    t.integer  "employee_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "members", ["company_id"], name: "index_members_on_company_id"
  add_index "members", ["company_location_id"], name: "index_members_on_company_location_id"
  add_index "members", ["department_id"], name: "index_members_on_department_id"
  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["employee_id"], name: "index_members_on_employee_id"
  add_index "members", ["member_code"], name: "index_members_on_member_code", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  add_index "members", ["role_id"], name: "index_members_on_role_id"

  create_table "nationalities", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "degree_id"
    t.integer  "degree_type_id"
    t.integer  "degree_stream_id"
    t.integer  "year_id"
    t.integer  "university_id"
    t.string   "college"
    t.string   "marks_type"
    t.string   "marks"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "qualifications", ["degree_id"], name: "index_qualifications_on_degree_id"
  add_index "qualifications", ["degree_stream_id"], name: "index_qualifications_on_degree_stream_id"
  add_index "qualifications", ["degree_type_id"], name: "index_qualifications_on_degree_type_id"
  add_index "qualifications", ["employee_id"], name: "index_qualifications_on_employee_id"
  add_index "qualifications", ["university_id"], name: "index_qualifications_on_university_id"
  add_index "qualifications", ["year_id"], name: "index_qualifications_on_year_id"

  create_table "roles", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skillsets", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "name"
    t.string   "description"
    t.string   "skill_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "skillsets", ["employee_id"], name: "index_skillsets_on_employee_id"

  create_table "states", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id"

  create_table "universities", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "years", force: :cascade do |t|
    t.integer  "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
