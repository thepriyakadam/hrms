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

ActiveRecord::Schema.define(version: 20151118095539) do

  create_table "awards", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "award_name"
    t.integer  "year"
    t.string   "award_from"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "awards", ["employee_id"], name: "index_awards_on_employee_id"

  create_table "blood_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifications", force: :cascade do |t|
    t.integer  "qualification_id"
    t.string   "name"
    t.integer  "year"
    t.string   "duration"
    t.text     "descripation"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "certifications", ["qualification_id"], name: "index_certifications_on_qualification_id"

  create_table "companies", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.string   "registration_no"
    t.string   "pan_card_no"
    t.string   "tax_no"
    t.string   "professional_tax_no"
    t.text     "address"
    t.string   "city"
    t.string   "district"
    t.integer  "pin_code"
    t.string   "state"
    t.string   "email"
    t.string   "contact_no"
    t.string   "web_site"
    t.date     "starting_date"
    t.string   "ceo_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "company_type_id"
  end

  add_index "companies", ["company_type_id"], name: "index_companies_on_company_type_id"
  add_index "companies", ["group_id"], name: "index_companies_on_group_id"

  create_table "company_locations", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "district"
    t.integer  "pin_code"
    t.string   "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "company_locations", ["company_id"], name: "index_company_locations_on_company_id"

  create_table "company_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "department_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer  "company_location_id"
    t.string   "name"
    t.string   "address"
    t.integer  "pin_code"
    t.string   "head_of_department"
    t.string   "contact_no"
    t.string   "manager"
    t.string   "hr"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "department_type_id"
  end

  add_index "departments", ["company_location_id"], name: "index_departments_on_company_location_id"
  add_index "departments", ["department_type_id"], name: "index_departments_on_department_type_id"

  create_table "employee_grades", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_physicals", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "hieght"
    t.string   "weight"
    t.string   "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employee_physicals", ["employee_id"], name: "index_employee_physicals_on_employee_id"

  create_table "employee_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "contact_no"
    t.string   "email"
    t.string   "permanent_address"
    t.string   "city"
    t.string   "district"
    t.string   "state"
    t.integer  "pin_code"
    t.string   "current_address"
    t.string   "adhar_no"
    t.string   "pan_no"
    t.string   "licence_no"
    t.string   "passport_no"
    t.string   "marital_status"
    t.integer  "nationality_id"
    t.integer  "blood_group_id"
    t.string   "handicap"
    t.string   "status"
    t.integer  "employee_type_id"
    t.string   "gender"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "employees", ["blood_group_id"], name: "index_employees_on_blood_group_id"
  add_index "employees", ["department_id"], name: "index_employees_on_department_id"
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id"
  add_index "employees", ["nationality_id"], name: "index_employees_on_nationality_id"

  create_table "experinces", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "no_of_year_experince"
    t.string   "company_name"
    t.string   "designation"
    t.string   "ctc"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "experinces", ["employee_id"], name: "index_experinces_on_employee_id"

  create_table "families", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "no_of_member"
    t.string   "f_name"
    t.string   "m_name"
    t.string   "l_name"
    t.date     "date_of_birth"
    t.integer  "age"
    t.string   "contact_no"
    t.string   "phone_no"
    t.string   "email"
    t.string   "permanent_address"
    t.string   "city"
    t.string   "dist"
    t.string   "state"
    t.integer  "pin_code"
    t.string   "current_address"
    t.string   "relation"
    t.string   "adhar_no"
    t.string   "pan_no"
    t.string   "passport_no"
    t.string   "medical_claim"
    t.string   "marital"
    t.string   "status"
    t.integer  "nationality_id"
    t.string   "blood_group"
    t.string   "religion"
    t.string   "phandicap"
    t.string   "profession"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "families", ["employee_id"], name: "index_families_on_employee_id"
  add_index "families", ["nationality_id"], name: "index_families_on_nationality_id"

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
  end

  add_index "groups", ["email"], name: "index_groups_on_email", unique: true
  add_index "groups", ["reset_password_token"], name: "index_groups_on_reset_password_token", unique: true
  add_index "groups", ["subdomain"], name: "index_groups_on_subdomain", unique: true

  create_table "joining_details", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "joining_date"
    t.string   "reffernce_from"
    t.string   "admin_hr"
    t.string   "tech_hr"
    t.string   "designation"
    t.string   "ctc"
    t.string   "account_no"
    t.integer  "employee_grade_id"
    t.date     "confirmation_date"
    t.string   "status"
    t.string   "probation_period"
    t.string   "notice_period"
    t.string   "medical_schem"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "joining_details", ["employee_grade_id"], name: "index_joining_details_on_employee_grade_id"
  add_index "joining_details", ["employee_id"], name: "index_joining_details_on_employee_id"

  create_table "leav_requests", force: :cascade do |t|
    t.integer  "leav_type_id"
    t.integer  "employee_id"
    t.string   "available_leaves"
    t.string   "leave"
    t.datetime "date_from"
    t.datetime "date_to"
    t.string   "no_of_days"
    t.text     "reason"
    t.date     "applied_on"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "leav_requests", ["employee_id"], name: "index_leav_requests_on_employee_id"
  add_index "leav_requests", ["leav_type_id"], name: "index_leav_requests_on_leav_type_id"

  create_table "leav_types", force: :cascade do |t|
    t.string   "leave_type"
    t.string   "no_of_leave"
    t.datetime "leave_expiry_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
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
    t.integer  "account_id"
    t.string   "account_type"
  end

  add_index "members", ["account_type", "account_id"], name: "index_members_on_account_type_and_account_id"
  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "nationalities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "ssc"
    t.string   "ssc_from"
    t.string   "ssc_marks"
    t.integer  "ssc_year"
    t.string   "ssc_bord"
    t.string   "deploma"
    t.string   "deploma_from"
    t.string   "deploma_marks"
    t.integer  "deploma_year"
    t.string   "deploma_university"
    t.string   "hsc"
    t.string   "hsc_from"
    t.string   "hsc_marks"
    t.integer  "hsc_year"
    t.string   "hsc_bord"
    t.string   "ug"
    t.string   "ug_from"
    t.string   "ug_marks"
    t.integer  "ug_year"
    t.string   "ug_university"
    t.string   "pg"
    t.string   "pg_from"
    t.string   "pg_marks"
    t.integer  "pg_yaer"
    t.string   "pg_university"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "qualifications", ["employee_id"], name: "index_qualifications_on_employee_id"

  create_table "skillsets", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "name"
    t.string   "skill_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "skillsets", ["employee_id"], name: "index_skillsets_on_employee_id"

end
