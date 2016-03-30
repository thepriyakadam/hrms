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

ActiveRecord::Schema.define(version: 20160330043725) do

  create_table "advance_salaries", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "advance_amount",    precision: 15, scale: 2
    t.string   "no_of_instalment"
    t.decimal  "instalment_amount", precision: 15, scale: 2
    t.date     "advance_date"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "advance_type_id"
    t.decimal  "interest",          precision: 15, scale: 2
  end

  add_index "advance_salaries", ["advance_type_id"], name: "index_advance_salaries_on_advance_type_id"
  add_index "advance_salaries", ["employee_id"], name: "index_advance_salaries_on_employee_id"

  create_table "advance_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "employee_shift_id"
    t.integer  "employee_id"
    t.date     "attendance_date"
    t.time     "check_in"
    t.time     "check_out"
    t.decimal  "company_hrs"
    t.decimal  "over_time_hrs"
    t.decimal  "total_hrs"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "shift_rotation_id"
  end

  add_index "attendances", ["employee_id"], name: "index_attendances_on_employee_id"
  add_index "attendances", ["employee_shift_id"], name: "index_attendances_on_employee_shift_id"
  add_index "attendances", ["shift_rotation_id"], name: "index_attendances_on_shift_rotation_id"

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

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "blood_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bonus", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "bonus_amount", precision: 15, scale: 2, default: 0.0
    t.string   "bouns_date"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "bonus", ["employee_id"], name: "index_bonus_on_employee_id"

  create_table "bonus_employees", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "bonus_date"
    t.decimal  "amount",      precision: 15, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "bonus_employees", ["employee_id"], name: "index_bonus_employees_on_employee_id"

  create_table "bonus_masters", force: :cascade do |t|
    t.boolean  "is_bouns"
    t.decimal  "limit_amount",     precision: 15, scale: 2, default: 0.0
    t.decimal  "bonus_persentage", precision: 15, scale: 2, default: 0.0
    t.boolean  "status"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "capture_resumes", force: :cascade do |t|
    t.string   "name_of_candidate"
    t.string   "contact_no"
    t.string   "post_applied"
    t.string   "mode_of_application"
    t.date     "date_of_application"
    t.string   "url"
    t.string   "fax"
    t.text     "street"
    t.string   "country"
    t.string   "state"
    t.string   "district"
    t.string   "city"
    t.string   "zip_code"
    t.string   "current_job_title"
    t.string   "current_employeer"
    t.string   "skill_set"
    t.string   "additional_info"
    t.string   "email"
    t.string   "skype_id"
    t.string   "twitter"
    t.decimal  "current_salary"
    t.decimal  "expected_salary"
    t.string   "current_location"
    t.string   "notice_period"
    t.date     "interview_date"
    t.time     "interview_time"
    t.string   "reason"
    t.string   "work_experience"
    t.string   "candidate_call_status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
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
    t.time     "in_time"
    t.time     "out_time"
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

  create_table "employee_annual_salaries", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "salary_component_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.decimal  "percentage",                 precision: 5,  scale: 2
    t.integer  "parent_salary_component_id"
    t.boolean  "is_deducted"
    t.string   "to_be_paid"
    t.decimal  "max_amount",                 precision: 15, scale: 2
    t.decimal  "monthly_amount",             precision: 15, scale: 2
    t.decimal  "annual_amount",              precision: 15, scale: 2
    t.boolean  "is_taxable"
    t.decimal  "tax",                        precision: 15, scale: 2
    t.string   "base"
  end

  add_index "employee_annual_salaries", ["employee_id"], name: "index_employee_annual_salaries_on_employee_id"
  add_index "employee_annual_salaries", ["salary_component_id"], name: "index_employee_annual_salaries_on_salary_component_id"

  create_table "employee_arrear_items", force: :cascade do |t|
    t.integer  "employee_arrear_id"
    t.integer  "salary_component_id"
    t.decimal  "actual_amount",       precision: 15, scale: 2, default: 0.0
    t.decimal  "calculated_amount",   precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.boolean  "is_deducted"
  end

  add_index "employee_arrear_items", ["employee_arrear_id"], name: "index_employee_arrear_items_on_employee_arrear_id"
  add_index "employee_arrear_items", ["salary_component_id"], name: "index_employee_arrear_items_on_salary_component_id"

  create_table "employee_arrears", force: :cascade do |t|
    t.integer  "employee_id"
    t.boolean  "is_paid",                                    default: false
    t.date     "start_date"
    t.date     "end_date"
    t.date     "paid_date"
    t.decimal  "actual_amount",     precision: 15, scale: 2, default: 0.0
    t.decimal  "calculated_amount", precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "employee_arrears", ["employee_id"], name: "index_employee_arrears_on_employee_id"

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

  create_table "employee_categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.date     "expiry_date"
    t.string   "total_leave"
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
    t.decimal  "leave_count",        precision: 5, scale: 1
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "reason"
    t.boolean  "is_pending"
    t.boolean  "is_cancelled"
    t.boolean  "is_first_approved"
    t.boolean  "is_second_approved"
    t.boolean  "is_first_rejected"
    t.boolean  "is_second_rejected"
    t.integer  "current_status"
    t.integer  "first_reporter_id"
    t.integer  "second_reporter_id"
  end

  add_index "employee_leav_requests", ["employee_id"], name: "index_employee_leav_requests_on_employee_id"
  add_index "employee_leav_requests", ["first_reporter_id"], name: "index_employee_leav_requests_on_first_reporter_id"
  add_index "employee_leav_requests", ["leav_category_id"], name: "index_employee_leav_requests_on_leav_category_id"
  add_index "employee_leav_requests", ["second_reporter_id"], name: "index_employee_leav_requests_on_second_reporter_id"

  create_table "employee_monthly_days", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "month"
    t.integer  "year_id"
    t.decimal  "overtime",          precision: 4, scale: 1
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "no_of_working_day"
  end

  add_index "employee_monthly_days", ["employee_id"], name: "index_employee_monthly_days_on_employee_id"
  add_index "employee_monthly_days", ["year_id"], name: "index_employee_monthly_days_on_year_id"

  create_table "employee_physicals", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "height"
    t.string   "weight"
    t.string   "size"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "trouser_size"
  end

  add_index "employee_physicals", ["employee_id"], name: "index_employee_physicals_on_employee_id"

  create_table "employee_salary_templates", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "salary_template_id"
    t.integer  "salary_component_id"
    t.boolean  "is_deducted"
    t.integer  "parent_salary_component_id"
    t.decimal  "percentage",                 precision: 15, scale: 2
    t.boolean  "is_taxable"
    t.decimal  "tax",                        precision: 4,  scale: 2
    t.string   "base"
    t.string   "to_be_paid"
    t.decimal  "max_amount",                 precision: 15, scale: 2
    t.decimal  "monthly_amount",             precision: 15, scale: 2, default: 0.0
    t.decimal  "annual_amount",              precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.integer  "employee_template_id"
  end

  add_index "employee_salary_templates", ["employee_id"], name: "index_employee_salary_templates_on_employee_id"
  add_index "employee_salary_templates", ["employee_template_id"], name: "index_employee_salary_templates_on_employee_template_id"
  add_index "employee_salary_templates", ["parent_salary_component_id"], name: "index_employee_salary_templates_on_parent_salary_component_id"
  add_index "employee_salary_templates", ["salary_component_id"], name: "index_employee_salary_templates_on_salary_component_id"
  add_index "employee_salary_templates", ["salary_template_id"], name: "index_employee_salary_templates_on_salary_template_id"

  create_table "employee_shifts", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employee_shifts", ["employee_id"], name: "index_employee_shifts_on_employee_id"

  create_table "employee_shifts_shift_rotations", force: :cascade do |t|
    t.integer  "shift_rotation_id"
    t.integer  "employee_shift_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "employee_shifts_shift_rotations", ["employee_shift_id"], name: "index_employee_shifts_shift_rotations_on_employee_shift_id"
  add_index "employee_shifts_shift_rotations", ["shift_rotation_id"], name: "index_employee_shifts_shift_rotations_on_shift_rotation_id"

  create_table "employee_templates", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "salary_template_id"
    t.boolean  "is_active",          default: true
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "employee_templates", ["employee_id"], name: "index_employee_templates_on_employee_id"
  add_index "employee_templates", ["salary_template_id"], name: "index_employee_templates_on_salary_template_id"

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
    t.integer  "manager_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "religion_id"
    t.integer  "manager_2_id"
    t.integer  "company_location_id"
    t.integer  "company_id"
  end

  add_index "employees", ["blood_group_id"], name: "index_employees_on_blood_group_id"
  add_index "employees", ["company_id"], name: "index_employees_on_company_id"
  add_index "employees", ["company_location_id"], name: "index_employees_on_company_location_id"
  add_index "employees", ["country_id"], name: "index_employees_on_country_id"
  add_index "employees", ["department_id"], name: "index_employees_on_department_id"
  add_index "employees", ["district_id"], name: "index_employees_on_district_id"
  add_index "employees", ["employee_code"], name: "index_employees_on_employee_code"
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id"
  add_index "employees", ["manager_2_id"], name: "index_employees_on_manager_2_id"
  add_index "employees", ["manager_id"], name: "index_employees_on_manager_id"
  add_index "employees", ["nationality_id"], name: "index_employees_on_nationality_id"
  add_index "employees", ["religion_id"], name: "index_employees_on_religion_id"
  add_index "employees", ["state_id"], name: "index_employees_on_state_id"

  create_table "esic_masters", force: :cascade do |t|
    t.boolean  "esic"
    t.decimal  "percentage",     precision: 15, scale: 2, default: 0.0
    t.decimal  "decimal",        precision: 15, scale: 2, default: 0.0
    t.date     "date_effective"
    t.decimal  "max_limit",      precision: 15, scale: 2, default: 0.0
    t.string   "base_component"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "excel_uploads", force: :cascade do |t|
    t.string   "code"
    t.string   "file_name"
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expencess_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.string   "is_handicap"
    t.string   "handicap_type"
    t.string   "profession"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "gender"
    t.integer  "blood_group_id"
    t.integer  "religion_id"
  end

  add_index "families", ["blood_group_id"], name: "index_families_on_blood_group_id"
  add_index "families", ["employee_id"], name: "index_families_on_employee_id"
  add_index "families", ["religion_id"], name: "index_families_on_religion_id"

  create_table "food_coupan_masters", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "food_deductions", force: :cascade do |t|
    t.date     "food_date"
    t.integer  "no_of_coupan"
    t.decimal  "amount",                precision: 15, scale: 2, default: 0.0
    t.integer  "employee_id"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "food_coupan_master_id"
    t.integer  "return_coupan"
    t.integer  "total_coupan"
  end

  add_index "food_deductions", ["employee_id"], name: "index_food_deductions_on_employee_id"
  add_index "food_deductions", ["food_coupan_master_id"], name: "index_food_deductions_on_food_coupan_master_id"

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

  create_table "holidays", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.date     "holiday_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "isweekend"
  end

  create_table "instalments", force: :cascade do |t|
    t.integer  "advance_salary_id"
    t.date     "instalment_date"
    t.decimal  "instalment_amount", precision: 15, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.boolean  "is_complete",                                default: false
  end

  add_index "instalments", ["advance_salary_id"], name: "index_instalments_on_advance_salary_id"

  create_table "interview_schedules", force: :cascade do |t|
    t.string   "interviewer_name"
    t.string   "candidate_name"
    t.date     "interview_date"
    t.time     "interview_time"
    t.string   "location"
    t.text     "schedule_comments"
    t.string   "post_title"
    t.string   "interview_type"
    t.string   "interview_status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

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
    t.string   "employee_uan_no"
    t.string   "employee_pf_no"
    t.string   "employee_efic_no"
    t.string   "select_pf"
    t.string   "pf_max_amount"
    t.boolean  "have_esic"
    t.integer  "cost_center_id"
    t.integer  "employee_category_id"
    t.integer  "payment_mode_id"
    t.integer  "department_id"
    t.boolean  "have_retention"
    t.boolean  "is_society_member"
    t.date     "retirement_date"
    t.integer  "reserved_category_id"
  end

  add_index "joining_details", ["cost_center_id"], name: "index_joining_details_on_cost_center_id"
  add_index "joining_details", ["department_id"], name: "index_joining_details_on_department_id"
  add_index "joining_details", ["employee_category_id"], name: "index_joining_details_on_employee_category_id"
  add_index "joining_details", ["employee_designation_id"], name: "index_joining_details_on_employee_designation_id"
  add_index "joining_details", ["employee_grade_id"], name: "index_joining_details_on_employee_grade_id"
  add_index "joining_details", ["employee_id"], name: "index_joining_details_on_employee_id"
  add_index "joining_details", ["payment_mode_id"], name: "index_joining_details_on_payment_mode_id"
  add_index "joining_details", ["reserved_category_id"], name: "index_joining_details_on_reserved_category_id"

  create_table "leav_approveds", force: :cascade do |t|
    t.integer  "employee_leav_request_id"
    t.datetime "approved_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "employee_id"
  end

  add_index "leav_approveds", ["employee_id"], name: "index_leav_approveds_on_employee_id"
  add_index "leav_approveds", ["employee_leav_request_id"], name: "index_leav_approveds_on_employee_leav_request_id"

  create_table "leav_cancelleds", force: :cascade do |t|
    t.integer  "employee_leav_request_id"
    t.datetime "cancelled_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "employee_id"
  end

  add_index "leav_cancelleds", ["employee_id"], name: "index_leav_cancelleds_on_employee_id"
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
    t.integer  "employee_id"
  end

  add_index "leav_rejecteds", ["employee_id"], name: "index_leav_rejecteds_on_employee_id"
  add_index "leav_rejecteds", ["employee_leav_request_id"], name: "index_leav_rejecteds_on_employee_leav_request_id"

  create_table "leave_c_offs", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "c_off_date"
    t.string   "c_off_type"
    t.integer  "c_off_expire_day", default: 60
    t.boolean  "expiry_status"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "leave_c_offs", ["employee_id"], name: "index_leave_c_offs_on_employee_id"

  create_table "leave_status_records", force: :cascade do |t|
    t.integer  "employee_leav_request_id"
    t.integer  "change_status_employee_id"
    t.string   "status"
    t.datetime "change_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "leave_status_records", ["change_status_employee_id"], name: "index_leave_status_records_on_change_status_employee_id"
  add_index "leave_status_records", ["employee_leav_request_id"], name: "index_leave_status_records_on_employee_leav_request_id"

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

  create_table "monthly_expences", force: :cascade do |t|
    t.date     "expence_date"
    t.decimal  "amount",            precision: 15, scale: 2, default: 0.0
    t.integer  "employee_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "expencess_type_id"
  end

  add_index "monthly_expences", ["employee_id"], name: "index_monthly_expences_on_employee_id"
  add_index "monthly_expences", ["expencess_type_id"], name: "index_monthly_expences_on_expencess_type_id"

  create_table "nationalities", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "other_salary_components", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.string   "is_deducted"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "overtime_daily_records", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "ot_daily_date"
    t.decimal  "ot_daily_hrs",            precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_rate",                 precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_daily_amount",         precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.decimal  "attendance_bonus_amount", precision: 15, scale: 2, default: 0.0
    t.decimal  "paid_holiday_amount",     precision: 15, scale: 2, default: 0.0
  end

  add_index "overtime_daily_records", ["employee_id"], name: "index_overtime_daily_records_on_employee_id"

  create_table "overtime_masters", force: :cascade do |t|
    t.boolean  "is_over_time"
    t.integer  "day"
    t.decimal  "company_hrs",  precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_rate",      precision: 15, scale: 2, default: 0.0
    t.boolean  "is_esic"
    t.boolean  "status"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "overtime_month_records", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "overtime_data"
    t.decimal  "attendance_bonus_amount", precision: 15, scale: 2
    t.decimal  "paid_holiday_amount",     precision: 15, scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "overtime_month_records", ["employee_id"], name: "index_overtime_month_records_on_employee_id"

  create_table "overtime_salaries", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "ot_hrs",                  precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_esic_amount",          precision: 15, scale: 2, default: 0.0
    t.decimal  "total_amount",            precision: 15, scale: 2, default: 0.0
    t.decimal  "attendence_bouns_amount", precision: 15, scale: 2, default: 0.0
    t.decimal  "paid_holiday_amount",     precision: 15, scale: 2, default: 0.0
    t.decimal  "net_payble_amount",       precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.date     "ot_date"
    t.decimal  "basic_amount",            precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_amount",               precision: 15, scale: 2, default: 0.0
  end

  add_index "overtime_salaries", ["employee_id"], name: "index_overtime_salaries_on_employee_id"

  create_table "overtimes", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "ot_date"
    t.string   "ot_type"
    t.string   "ot_total_hrs"
    t.string   "total_production"
    t.string   "normal_wages_rate"
    t.string   "ot_wages_rate"
    t.string   "ot_earning"
    t.date     "paid_on_date"
    t.text     "remarks"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "overtimes", ["employee_id"], name: "index_overtimes_on_employee_id"

  create_table "particular_leave_records", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "employee_leav_request_id"
    t.datetime "leave_date"
    t.boolean  "is_full"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "leav_category_id"
  end

  add_index "particular_leave_records", ["employee_id"], name: "index_particular_leave_records_on_employee_id"
  add_index "particular_leave_records", ["employee_leav_request_id"], name: "index_particular_leave_records_on_employee_leav_request_id"
  add_index "particular_leave_records", ["leav_category_id"], name: "index_particular_leave_records_on_leav_category_id"

  create_table "payment_modes", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pf_masters", force: :cascade do |t|
    t.boolean  "is_pf"
    t.decimal  "percentage",     precision: 4,  scale: 2
    t.date     "date_effective"
    t.decimal  "min_limit",      precision: 15, scale: 2
    t.string   "base_component"
    t.boolean  "is_active"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "professional_taxes", force: :cascade do |t|
    t.string   "is_pt"
    t.decimal  "min_salary",  precision: 15, scale: 2, default: 0.0
    t.decimal  "max_salary",  precision: 15, scale: 2, default: 0.0
    t.decimal  "pt_amount",   precision: 15, scale: 2, default: 0.0
    t.decimal  "for_months",  precision: 15, scale: 2, default: 0.0
    t.decimal  "march_month", precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
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

  create_table "religions", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reporting_masters", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reporting_masters", ["employee_id"], name: "index_reporting_masters_on_employee_id"

  create_table "reserved_categories", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "retention_moneys", force: :cascade do |t|
    t.boolean  "have_retention"
    t.decimal  "amount",         precision: 15, scale: 2
    t.decimal  "decimal",        precision: 15, scale: 2
    t.string   "no_of_month"
    t.string   "description"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "salary_component_templates", force: :cascade do |t|
    t.string   "manual_template_code"
    t.integer  "salary_template_id"
    t.integer  "salary_component_id"
    t.boolean  "is_deducted"
    t.integer  "parent_salary_component_id"
    t.decimal  "percentage",                 precision: 4,  scale: 2
    t.boolean  "is_taxable"
    t.decimal  "tax",                        precision: 4,  scale: 2
    t.string   "base"
    t.string   "to_be_paid"
    t.decimal  "max_amount",                 precision: 15, scale: 2
    t.decimal  "monthly_amount",             precision: 15, scale: 2
    t.decimal  "annual_amount",              precision: 15, scale: 2
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "salary_component_templates", ["parent_salary_component_id"], name: "index_salary_component_templates_on_parent_salary_component_id"
  add_index "salary_component_templates", ["salary_component_id"], name: "index_salary_component_templates_on_salary_component_id"
  add_index "salary_component_templates", ["salary_template_id"], name: "index_salary_component_templates_on_salary_template_id"

  create_table "salary_components", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_deducted"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "parent_id"
  end

  add_index "salary_components", ["parent_id"], name: "index_salary_components_on_parent_id"

  create_table "salary_templates", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.date     "validity_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "salaryslip_components", force: :cascade do |t|
    t.integer  "salaryslip_id"
    t.integer  "salary_component_id"
    t.decimal  "actual_amount",        precision: 15, scale: 2
    t.boolean  "is_deducted"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "other_component_name"
    t.decimal  "calculated_amount",    precision: 15, scale: 2
    t.integer  "employee_template_id"
    t.boolean  "is_arrear"
  end

  add_index "salaryslip_components", ["employee_template_id"], name: "index_salaryslip_components_on_employee_template_id"
  add_index "salaryslip_components", ["salary_component_id"], name: "index_salaryslip_components_on_salary_component_id"
  add_index "salaryslip_components", ["salaryslip_id"], name: "index_salaryslip_components_on_salaryslip_id"

  create_table "salaryslips", force: :cascade do |t|
    t.string   "salary_slip_code"
    t.integer  "employee_id"
    t.integer  "workingday_id"
    t.decimal  "actual_gross_salary",        precision: 15, scale: 2
    t.decimal  "actual_total_deduction",     precision: 15, scale: 2
    t.decimal  "actual_net_salary",          precision: 15, scale: 2
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "salary_template_id"
    t.string   "month"
    t.string   "year"
    t.decimal  "calculated_gross_salary",    precision: 15, scale: 2
    t.decimal  "calculated_total_deduction", precision: 15, scale: 2
    t.decimal  "calculated_net_salary",      precision: 15, scale: 2
    t.date     "month_year"
    t.integer  "employee_template_id"
    t.decimal  "arrear_actual_amount",       precision: 15, scale: 2
    t.decimal  "arrear_calculated_amount",   precision: 15, scale: 2
  end

  add_index "salaryslips", ["employee_id"], name: "index_salaryslips_on_employee_id"
  add_index "salaryslips", ["employee_template_id"], name: "index_salaryslips_on_employee_template_id"
  add_index "salaryslips", ["salary_template_id"], name: "index_salaryslips_on_salary_template_id"
  add_index "salaryslips", ["workingday_id"], name: "index_salaryslips_on_workingday_id"

  create_table "shift_rotations", force: :cascade do |t|
    t.integer  "company_shift_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "shift_rotations", ["company_shift_id"], name: "index_shift_rotations_on_company_shift_id"

  create_table "skillsets", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "name"
    t.string   "description"
    t.string   "skill_level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "skillsets", ["employee_id"], name: "index_skillsets_on_employee_id"

  create_table "society_member_ships", force: :cascade do |t|
    t.boolean  "is_society_member"
    t.decimal  "amount",            precision: 15, scale: 2, default: 0.0
    t.integer  "employee_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "society_member_ships", ["employee_id"], name: "index_society_member_ships_on_employee_id"

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

  create_table "vacancy_masters", force: :cascade do |t|
    t.string   "job_title"
    t.string   "vacancy_name"
    t.string   "educational_qualification"
    t.integer  "no_of_position"
    t.text     "description"
    t.date     "vacancy_post_date"
    t.string   "department_name"
    t.string   "budget"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "week_offs", force: :cascade do |t|
    t.string   "weekoff_date_range"
    t.integer  "employee_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "week_offs", ["employee_id"], name: "index_week_offs_on_employee_id"

  create_table "well_faires", force: :cascade do |t|
    t.string   "month"
    t.decimal  "amount",     precision: 15, scale: 2, default: 0.0
    t.string   "status"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "workingdays", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "month_name"
    t.string   "year"
    t.integer  "day_in_month"
    t.decimal  "present_day"
    t.decimal  "total_leave"
    t.decimal  "holiday_in_month"
    t.decimal  "week_off_day"
    t.decimal  "absent_day"
    t.decimal  "payable_day"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "lwp_leave"
    t.string   "cl_leave"
    t.string   "el_leave"
    t.string   "esic_leave"
    t.string   "coff_leave"
    t.integer  "month"
  end

  add_index "workingdays", ["employee_id"], name: "index_workingdays_on_employee_id"

  create_table "years", force: :cascade do |t|
    t.integer  "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
