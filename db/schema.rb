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

ActiveRecord::Schema.define(version: 20170912114820) do

  create_table "about_bosses", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "about_companies", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "access_issue_requests", force: :cascade do |t|
    t.integer  "issue_tracker_access_id", limit: 4
    t.integer  "issue_request_id",        limit: 4
    t.integer  "issue_tracker_member_id", limit: 4
    t.boolean  "status"
    t.boolean  "current_status"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "access_issue_requests", ["issue_request_id"], name: "index_access_issue_requests_on_issue_request_id", using: :btree
  add_index "access_issue_requests", ["issue_tracker_access_id"], name: "index_access_issue_requests_on_issue_tracker_access_id", using: :btree
  add_index "access_issue_requests", ["issue_tracker_member_id"], name: "index_access_issue_requests_on_issue_tracker_member_id", using: :btree

  create_table "accident_images", force: :cascade do |t|
    t.integer  "accident_record_id",  limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "accident_images", ["accident_record_id"], name: "index_accident_images_on_accident_record_id", using: :btree

  create_table "accident_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "accident_records", force: :cascade do |t|
    t.string   "code",                 limit: 255
    t.integer  "employee_id",          limit: 4
    t.date     "accident_date"
    t.string   "esic_no",              limit: 255
    t.string   "case_type",            limit: 255
    t.string   "type_of_injury",       limit: 255
    t.string   "leave_date_range",     limit: 255
    t.string   "no_of_day",            limit: 255
    t.text     "description",          limit: 65535
    t.integer  "root_cause_master_id", limit: 4
    t.integer  "department_id",        limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "avatar_file_name",     limit: 255
    t.string   "avatar_content_type",  limit: 255
    t.integer  "avatar_file_size",     limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "accident_records", ["department_id"], name: "index_accident_records_on_department_id", using: :btree
  add_index "accident_records", ["employee_id"], name: "index_accident_records_on_employee_id", using: :btree
  add_index "accident_records", ["root_cause_master_id"], name: "index_accident_records_on_root_cause_master_id", using: :btree

  create_table "advance_salaries", force: :cascade do |t|
    t.integer  "employee_id",       limit: 4
    t.decimal  "advance_amount",                precision: 15, scale: 2
    t.string   "no_of_instalment",  limit: 255
    t.decimal  "instalment_amount",             precision: 15, scale: 2
    t.date     "advance_date"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "advance_type_id",   limit: 4
    t.decimal  "interest",                      precision: 15, scale: 2
  end

  add_index "advance_salaries", ["advance_type_id"], name: "index_advance_salaries_on_advance_type_id", using: :btree
  add_index "advance_salaries", ["employee_id"], name: "index_advance_salaries_on_employee_id", using: :btree

  create_table "advance_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "appraisees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appraiser_ratings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appraisers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "approval_processes", force: :cascade do |t|
    t.integer  "membership_id", limit: 4
    t.decimal  "from",                    precision: 15, scale: 2
    t.decimal  "to",                      precision: 15, scale: 2
    t.boolean  "status"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "approval_processes", ["membership_id"], name: "index_approval_processes_on_membership_id", using: :btree

  create_table "asset_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "assigned_assets", force: :cascade do |t|
    t.integer  "employee_id",   limit: 4
    t.integer  "asset_type_id", limit: 4
    t.string   "assets_detail", limit: 255
    t.string   "assets_id",     limit: 255
    t.decimal  "assets_value",                precision: 10
    t.string   "assest_status", limit: 255
    t.date     "issue_date"
    t.date     "valid_till"
    t.date     "returned_on"
    t.text     "remarks",       limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "assigned_assets", ["asset_type_id"], name: "index_assigned_assets_on_asset_type_id", using: :btree
  add_index "assigned_assets", ["employee_id"], name: "index_assigned_assets_on_employee_id", using: :btree

  create_table "attendances", force: :cascade do |t|
    t.integer  "employee_shift_id", limit: 4
    t.integer  "employee_id",       limit: 4
    t.date     "attendance_date"
    t.integer  "shift_rotation_id", limit: 4
    t.time     "check_in"
    t.time     "check_out"
    t.decimal  "company_hrs",                 precision: 10
    t.decimal  "over_time_hrs",               precision: 10
    t.decimal  "total_hrs",                   precision: 10
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "attendances", ["employee_id"], name: "index_attendances_on_employee_id", using: :btree
  add_index "attendances", ["employee_shift_id"], name: "index_attendances_on_employee_shift_id", using: :btree
  add_index "attendances", ["shift_rotation_id"], name: "index_attendances_on_shift_rotation_id", using: :btree

  create_table "attribute_masters", force: :cascade do |t|
    t.string   "code",                limit: 255
    t.string   "name",                limit: 255
    t.text     "definition",          limit: 65535
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.boolean  "attribute_weightage"
    t.string   "from",                limit: 255
    t.string   "to",                  limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "attribute_rating_sheets", force: :cascade do |t|
    t.integer  "appraisee_id",          limit: 4
    t.integer  "appraiser_id",          limit: 4
    t.integer  "employee_attribute_id", limit: 4
    t.text     "appraisee_comment",     limit: 65535
    t.text     "appraiser_comment",     limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_confirm_appraiser"
    t.boolean  "is_confirm_appraisee"
    t.text     "appraiser2_comment",    limit: 65535
    t.text     "final_comment",         limit: 65535
    t.integer  "final_id_id",           limit: 4
    t.integer  "appraiser_2_id",        limit: 4
    t.boolean  "is_confirm_final"
    t.boolean  "is_confirm_appraiser2"
    t.integer  "appraisee_rating_id",   limit: 4
    t.integer  "appraiser_rating_id",   limit: 4
    t.integer  "appraiser2_rating_id",  limit: 4
    t.integer  "final_rating_id",       limit: 4
  end

  add_index "attribute_rating_sheets", ["appraisee_id"], name: "index_attribute_rating_sheets_on_appraisee_id", using: :btree
  add_index "attribute_rating_sheets", ["appraisee_rating_id"], name: "index_attribute_rating_sheets_on_appraisee_rating_id", using: :btree
  add_index "attribute_rating_sheets", ["appraiser2_rating_id"], name: "index_attribute_rating_sheets_on_appraiser2_rating_id", using: :btree
  add_index "attribute_rating_sheets", ["appraiser_2_id"], name: "index_attribute_rating_sheets_on_appraiser_2_id", using: :btree
  add_index "attribute_rating_sheets", ["appraiser_id"], name: "index_attribute_rating_sheets_on_appraiser_id", using: :btree
  add_index "attribute_rating_sheets", ["appraiser_rating_id"], name: "index_attribute_rating_sheets_on_appraiser_rating_id", using: :btree
  add_index "attribute_rating_sheets", ["employee_attribute_id"], name: "index_attribute_rating_sheets_on_employee_attribute_id", using: :btree
  add_index "attribute_rating_sheets", ["final_id_id"], name: "index_attribute_rating_sheets_on_final_id_id", using: :btree
  add_index "attribute_rating_sheets", ["final_rating_id"], name: "index_attribute_rating_sheets_on_final_rating_id", using: :btree

  create_table "attributes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorized_bies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "awards", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "award_name",  limit: 255
    t.string   "award_from",  limit: 255
    t.text     "description", limit: 65535
    t.integer  "year_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "awards", ["employee_id"], name: "index_awards_on_employee_id", using: :btree
  add_index "awards", ["year_id"], name: "index_awards_on_year_id", using: :btree

  create_table "banks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "code",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "blood_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bonus", force: :cascade do |t|
    t.integer  "employee_id",  limit: 4
    t.decimal  "bonus_amount",             precision: 15, scale: 2, default: 0.0
    t.string   "bouns_date",   limit: 255
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "bonus", ["employee_id"], name: "index_bonus_on_employee_id", using: :btree

  create_table "bonus_employees", force: :cascade do |t|
    t.integer  "employee_id",   limit: 4
    t.date     "bonus_date"
    t.decimal  "amount",                  precision: 15, scale: 2
    t.decimal  "actual_amount",           precision: 10
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "bonus_employees", ["employee_id"], name: "index_bonus_employees_on_employee_id", using: :btree

  create_table "bonus_employers", force: :cascade do |t|
    t.string   "base_component", limit: 255
    t.decimal  "limit_amount",               precision: 10
    t.decimal  "percentage",                 precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "bonus_masters", force: :cascade do |t|
    t.boolean  "is_bouns"
    t.decimal  "limit_amount",     precision: 15, scale: 2, default: 0.0
    t.decimal  "bonus_persentage", precision: 15, scale: 2, default: 0.0
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  create_table "candidate_forms", force: :cascade do |t|
    t.integer  "vacancy_request_id",     limit: 4
    t.string   "name",                   limit: 255
    t.integer  "qualification_id",       limit: 4
    t.integer  "degree_id",              limit: 4
    t.string   "skill_set",              limit: 255
    t.integer  "contact_no",             limit: 4
    t.string   "email",                  limit: 255
    t.string   "candidate_type",         limit: 255
    t.string   "experience",             limit: 255
    t.string   "notice_period",          limit: 255
    t.integer  "selected_by_id",         limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "document1_file_name",    limit: 255
    t.string   "document1_content_type", limit: 255
    t.integer  "document1_file_size",    limit: 4
    t.datetime "document1_updated_at"
    t.string   "document2_file_name",    limit: 255
    t.string   "document2_content_type", limit: 255
    t.integer  "document2_file_size",    limit: 4
    t.datetime "document2_updated_at"
  end

  add_index "candidate_forms", ["degree_id"], name: "index_candidate_forms_on_degree_id", using: :btree
  add_index "candidate_forms", ["qualification_id"], name: "index_candidate_forms_on_qualification_id", using: :btree
  add_index "candidate_forms", ["vacancy_request_id"], name: "index_candidate_forms_on_vacancy_request_id", using: :btree

  create_table "candidate_interview_schedules", force: :cascade do |t|
    t.integer  "candidate_form_id",        limit: 4
    t.integer  "interviewer_id",           limit: 4
    t.integer  "interview_type_master_id", limit: 4
    t.date     "date"
    t.time     "time"
    t.string   "place",                    limit: 255
    t.text     "address",                  limit: 65535
    t.text     "description",              limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "candidate_interview_schedules", ["candidate_form_id"], name: "index_candidate_interview_schedules_on_candidate_form_id", using: :btree
  add_index "candidate_interview_schedules", ["interview_type_master_id"], name: "index_candidate_interview_schedules_on_interview_type_master_id", using: :btree

  create_table "capture_resumes", force: :cascade do |t|
    t.string   "name_of_candidate",           limit: 255
    t.string   "contact_no",                  limit: 255
    t.string   "contact_no2",                 limit: 255
    t.string   "post_applied",                limit: 255
    t.string   "mode_of_application",         limit: 255
    t.date     "date_of_application"
    t.string   "url",                         limit: 255
    t.string   "fax",                         limit: 255
    t.text     "street",                      limit: 65535
    t.integer  "country_id",                  limit: 4
    t.integer  "state_id",                    limit: 4
    t.integer  "district_id",                 limit: 4
    t.integer  "employee_designation_id",     limit: 4
    t.string   "city",                        limit: 255
    t.string   "zip_code",                    limit: 255
    t.string   "current_job_title",           limit: 255
    t.string   "current_employeer",           limit: 255
    t.string   "skill_set",                   limit: 255
    t.string   "additional_info",             limit: 255
    t.string   "email",                       limit: 255
    t.string   "email2",                      limit: 255
    t.string   "skype_id",                    limit: 255
    t.string   "twitter",                     limit: 255
    t.string   "linkedin",                    limit: 255
    t.decimal  "current_salary",                            precision: 10
    t.decimal  "expected_salary",                           precision: 10
    t.string   "current_location",            limit: 255
    t.string   "notice_period",               limit: 255
    t.date     "interview_date"
    t.time     "interview_time"
    t.string   "reason",                      limit: 255
    t.string   "work_experience",             limit: 255
    t.string   "candidate_call_status",       limit: 255
    t.string   "job_title",                   limit: 255
    t.integer  "vacancy_master_id",           limit: 4
    t.integer  "degree_id",                   limit: 4
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "passport_photo_file_name",    limit: 255
    t.string   "passport_photo_content_type", limit: 255
    t.integer  "passport_photo_file_size",    limit: 4
    t.datetime "passport_photo_updated_at"
    t.string   "avatar_file_name",            limit: 255
    t.string   "avatar_content_type",         limit: 255
    t.integer  "avatar_file_size",            limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "capture_resumes", ["country_id"], name: "index_capture_resumes_on_country_id", using: :btree
  add_index "capture_resumes", ["degree_id"], name: "index_capture_resumes_on_degree_id", using: :btree
  add_index "capture_resumes", ["district_id"], name: "index_capture_resumes_on_district_id", using: :btree
  add_index "capture_resumes", ["employee_designation_id"], name: "index_capture_resumes_on_employee_designation_id", using: :btree
  add_index "capture_resumes", ["state_id"], name: "index_capture_resumes_on_state_id", using: :btree
  add_index "capture_resumes", ["vacancy_master_id"], name: "index_capture_resumes_on_vacancy_master_id", using: :btree

  create_table "certificate_masters", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "status"
    t.boolean  "confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.integer  "certificate_master_id", limit: 4
    t.text     "h1_start",              limit: 65535
    t.text     "h1_end",                limit: 65535
    t.text     "h2_start",              limit: 65535
    t.text     "h2_end",                limit: 65535
    t.text     "b1_start",              limit: 65535
    t.text     "b1_end",                limit: 65535
    t.text     "b2_start",              limit: 65535
    t.text     "b2_end",                limit: 65535
    t.text     "b3_start",              limit: 65535
    t.text     "b3_end",                limit: 65535
    t.text     "b4_start",              limit: 65535
    t.text     "b4_end",                limit: 65535
    t.text     "b5_start",              limit: 65535
    t.text     "b5_end",                limit: 65535
    t.text     "f1_start",              limit: 65535
    t.text     "f1_end",                limit: 65535
    t.text     "f2_start",              limit: 65535
    t.text     "f2_end",                limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "certificates", ["certificate_master_id"], name: "index_certificates_on_certificate_master_id", using: :btree

  create_table "certifications", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "name",        limit: 255
    t.string   "duration",    limit: 255
    t.integer  "year_id",     limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "certifications", ["employee_id"], name: "index_certifications_on_employee_id", using: :btree
  add_index "certifications", ["year_id"], name: "index_certifications_on_year_id", using: :btree

  create_table "change_designations", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.integer  "employee_designation_id", limit: 4
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "status"
    t.integer  "change_by_id",            limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "change_designations", ["employee_designation_id"], name: "index_change_designations_on_employee_designation_id", using: :btree
  add_index "change_designations", ["employee_id"], name: "index_change_designations_on_employee_id", using: :btree

  create_table "change_status_employees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "circulars", force: :cascade do |t|
    t.date     "date"
    t.string   "subject",               limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",      limit: 255
    t.string   "avatar_content_type",   limit: 255
    t.integer  "avatar_file_size",      limit: 4
    t.datetime "avatar_updated_at"
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
    t.string   "email",                 limit: 255
    t.boolean  "send_email"
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "group_id",                  limit: 4
    t.string   "manual_company_code",       limit: 255
    t.string   "company_code",              limit: 255
    t.text     "description",               limit: 65535
    t.string   "name",                      limit: 255
    t.integer  "company_type_id",           limit: 4
    t.string   "registration_no",           limit: 255
    t.string   "pan_card_no",               limit: 255
    t.string   "tax_no",                    limit: 255
    t.string   "professional_tax_no",       limit: 255
    t.text     "address",                   limit: 65535
    t.integer  "country_id",                limit: 4
    t.integer  "state_id",                  limit: 4
    t.integer  "district_id",               limit: 4
    t.string   "city",                      limit: 255
    t.integer  "pin_code",                  limit: 4
    t.string   "email",                     limit: 255
    t.string   "contact_no",                limit: 255
    t.string   "web_site",                  limit: 255
    t.date     "starting_date"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "company_logo_file_name",    limit: 255
    t.string   "company_logo_content_type", limit: 255
    t.integer  "company_logo_file_size",    limit: 4
    t.datetime "company_logo_updated_at"
  end

  add_index "companies", ["company_type_id"], name: "index_companies_on_company_type_id", using: :btree
  add_index "companies", ["country_id"], name: "index_companies_on_country_id", using: :btree
  add_index "companies", ["district_id"], name: "index_companies_on_district_id", using: :btree
  add_index "companies", ["group_id"], name: "index_companies_on_group_id", using: :btree
  add_index "companies", ["state_id"], name: "index_companies_on_state_id", using: :btree

  create_table "company_events", force: :cascade do |t|
    t.text     "event_name",  limit: 65535
    t.date     "event_date"
    t.string   "location",    limit: 255
    t.boolean  "status"
    t.string   "time",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "email",       limit: 255
    t.boolean  "send_email"
  end

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
    t.integer  "company_id",                   limit: 4
    t.string   "manual_company_location_code", limit: 255
    t.string   "location_code",                limit: 255
    t.string   "name",                         limit: 255
    t.string   "email",                        limit: 255
    t.string   "address",                      limit: 255
    t.string   "city",                         limit: 255
    t.integer  "country_id",                   limit: 4
    t.integer  "state_id",                     limit: 4
    t.integer  "district_id",                  limit: 4
    t.integer  "pin_code",                     limit: 4
    t.string   "contact_no",                   limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "company_locations", ["company_id"], name: "index_company_locations_on_company_id", using: :btree
  add_index "company_locations", ["country_id"], name: "index_company_locations_on_country_id", using: :btree
  add_index "company_locations", ["district_id"], name: "index_company_locations_on_district_id", using: :btree
  add_index "company_locations", ["state_id"], name: "index_company_locations_on_state_id", using: :btree

  create_table "company_policies", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.date     "effective_from"
    t.date     "effective_to"
    t.text     "description",           limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
    t.integer  "policy_type_id",        limit: 4
    t.string   "email",                 limit: 255
    t.boolean  "send_email"
  end

  add_index "company_policies", ["policy_type_id"], name: "index_company_policies_on_policy_type_id", using: :btree

  create_table "company_shifts", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.time     "in_time"
    t.time     "out_time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "company_time_masters", force: :cascade do |t|
    t.datetime "in_max_time"
    t.datetime "out_min_time"
    t.datetime "out_max_time"
    t.string   "working_hrs",     limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "in_time"
    t.datetime "out_time"
    t.datetime "in_min_time"
    t.string   "rest_time",       limit: 255
    t.integer  "shift_master_id", limit: 4
    t.boolean  "time_adjust"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "company_time_masters", ["shift_master_id"], name: "index_company_time_masters_on_shift_master_id", using: :btree

  create_table "company_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cost_centers", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "currency_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "custom_auto_increments", force: :cascade do |t|
    t.string   "counter_model_name", limit: 255
    t.integer  "counter",            limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_auto_increments", ["counter_model_name"], name: "index_custom_auto_increments_on_counter_model_name", using: :btree

  create_table "da_masters", force: :cascade do |t|
    t.boolean  "is_da"
    t.decimal  "minimum_wages",              precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "base_component", limit: 255
  end

  create_table "daily_attendances", force: :cascade do |t|
    t.string   "sr_no",         limit: 255
    t.date     "date"
    t.time     "time"
    t.string   "employee_code", limit: 255
    t.string   "card_no",       limit: 255
    t.string   "employee_name", limit: 255
    t.string   "controller",    limit: 255
    t.string   "reader_name",   limit: 255
    t.string   "access_status", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "daily_bill_detail_histories", force: :cascade do |t|
    t.integer  "daily_bill_detail_id",   limit: 4
    t.integer  "travel_expence_type_id", limit: 4
    t.string   "expence_date",           limit: 255
    t.string   "date",                   limit: 255
    t.string   "e_place",                limit: 255
    t.string   "string",                 limit: 255
    t.string   "travel_expence",         limit: 255
    t.string   "decimal",                limit: 255
    t.string   "is_confirm",             limit: 255
    t.string   "boolean",                limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "daily_bill_detail_histories", ["daily_bill_detail_id"], name: "index_daily_bill_detail_histories_on_daily_bill_detail_id", using: :btree
  add_index "daily_bill_detail_histories", ["travel_expence_type_id"], name: "index_daily_bill_detail_histories_on_travel_expence_type_id", using: :btree

  create_table "daily_bill_details", force: :cascade do |t|
    t.integer  "travel_request_id",           limit: 4
    t.date     "expence_date"
    t.string   "e_place",                     limit: 255
    t.decimal  "travel_expence",                            precision: 15, scale: 2, default: 0.0
    t.integer  "travel_expence_type_id",      limit: 4
    t.boolean  "is_confirm"
    t.string   "request_status",              limit: 255
    t.integer  "currency_master_id",          limit: 4
    t.text     "remark",                      limit: 65535
    t.text     "remarks",                     limit: 65535
    t.boolean  "is_sent"
    t.text     "comment",                     limit: 65535
    t.datetime "created_at",                                                                       null: false
    t.datetime "updated_at",                                                                       null: false
    t.string   "passport_photo_file_name",    limit: 255
    t.string   "passport_photo_content_type", limit: 255
    t.integer  "passport_photo_file_size",    limit: 4
    t.datetime "passport_photo_updated_at"
    t.string   "avatar_file_file_name",       limit: 255
    t.string   "avatar_file_content_type",    limit: 255
    t.integer  "avatar_file_file_size",       limit: 4
    t.datetime "avatar_file_updated_at"
    t.integer  "reporting_master_id",         limit: 4
  end

  add_index "daily_bill_details", ["currency_master_id"], name: "index_daily_bill_details_on_currency_master_id", using: :btree
  add_index "daily_bill_details", ["travel_expence_type_id"], name: "index_daily_bill_details_on_travel_expence_type_id", using: :btree
  add_index "daily_bill_details", ["travel_request_id"], name: "index_daily_bill_details_on_travel_request_id", using: :btree

  create_table "date_formats", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "is_active"
  end

  create_table "dearness_allowances", force: :cascade do |t|
    t.string   "base_component", limit: 255
    t.decimal  "minimum_wages",              precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "definitions", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "degree_1s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degree_2s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degree_streams", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "degree_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "department_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer  "company_location_id",    limit: 4
    t.string   "manual_department_code", limit: 255
    t.string   "department_code",        limit: 255
    t.text     "description",            limit: 65535
    t.string   "name",                   limit: 255
    t.integer  "department_type_id",     limit: 4
    t.string   "contact_no",             limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "departments", ["company_location_id"], name: "index_departments_on_company_location_id", using: :btree
  add_index "departments", ["department_type_id"], name: "index_departments_on_department_type_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.integer  "state_id",   limit: 4
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "districts", ["state_id"], name: "index_districts_on_state_id", using: :btree

  create_table "due_actions", force: :cascade do |t|
    t.integer  "due_detail_id",          limit: 4
    t.integer  "due_employee_detail_id", limit: 4
    t.string   "name",                   limit: 255
    t.text     "remark",                 limit: 65535
    t.decimal  "amount",                               precision: 10
    t.boolean  "is_confirm"
    t.boolean  "status",                                              default: false
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  add_index "due_actions", ["due_detail_id"], name: "index_due_actions_on_due_detail_id", using: :btree
  add_index "due_actions", ["due_employee_detail_id"], name: "index_due_actions_on_due_employee_detail_id", using: :btree

  create_table "due_details", force: :cascade do |t|
    t.integer  "due_employee_template_id", limit: 4
    t.integer  "reporting_master_id",      limit: 4
    t.integer  "due_template_id",          limit: 4
    t.boolean  "is_confirmed"
    t.boolean  "status"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "due_details", ["due_employee_template_id"], name: "index_due_details_on_due_employee_template_id", using: :btree
  add_index "due_details", ["due_template_id"], name: "index_due_details_on_due_template_id", using: :btree
  add_index "due_details", ["reporting_master_id"], name: "index_due_details_on_reporting_master_id", using: :btree

  create_table "due_employee_details", force: :cascade do |t|
    t.integer  "employee_id",              limit: 4
    t.integer  "due_template_id",          limit: 4
    t.integer  "due_employee_template_id", limit: 4
    t.integer  "due_detail_id",            limit: 4
    t.integer  "reporting_master_id",      limit: 4
    t.boolean  "is_confirmed"
    t.boolean  "is_proceed",                         default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "due_employee_details", ["due_detail_id"], name: "index_due_employee_details_on_due_detail_id", using: :btree
  add_index "due_employee_details", ["due_employee_template_id"], name: "index_due_employee_details_on_due_employee_template_id", using: :btree
  add_index "due_employee_details", ["due_template_id"], name: "index_due_employee_details_on_due_template_id", using: :btree
  add_index "due_employee_details", ["employee_id"], name: "index_due_employee_details_on_employee_id", using: :btree
  add_index "due_employee_details", ["reporting_master_id"], name: "index_due_employee_details_on_reporting_master_id", using: :btree

  create_table "due_employee_templates", force: :cascade do |t|
    t.integer  "employee_id",     limit: 4
    t.integer  "due_template_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "due_employee_templates", ["due_template_id"], name: "index_due_employee_templates_on_due_template_id", using: :btree
  add_index "due_employee_templates", ["employee_id"], name: "index_due_employee_templates_on_employee_id", using: :btree

  create_table "due_templates", force: :cascade do |t|
    t.string   "code",                  limit: 255
    t.string   "name",                  limit: 255
    t.boolean  "status"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  create_table "email_configs", force: :cascade do |t|
    t.string   "url_host",        limit: 255
    t.integer  "url_port",        limit: 4
    t.string   "delivery_method", limit: 255
    t.string   "address",         limit: 255
    t.integer  "port",            limit: 4
    t.string   "username",        limit: 255
    t.string   "pwd",             limit: 255
    t.string   "authentication",  limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "employee_annual_salaries", force: :cascade do |t|
    t.integer  "employee_id",                limit: 4
    t.integer  "salary_component_id",        limit: 4
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.decimal  "percentage",                             precision: 5,  scale: 2
    t.integer  "parent_salary_component_id", limit: 4
    t.boolean  "is_deducted"
    t.string   "to_be_paid",                 limit: 255
    t.decimal  "max_amount",                             precision: 15, scale: 2
    t.decimal  "monthly_amount",                         precision: 15, scale: 2
    t.decimal  "annual_amount",                          precision: 15, scale: 2
    t.boolean  "is_taxable"
    t.decimal  "tax",                                    precision: 15, scale: 2
    t.string   "base",                       limit: 255
  end

  add_index "employee_annual_salaries", ["employee_id"], name: "index_employee_annual_salaries_on_employee_id", using: :btree
  add_index "employee_annual_salaries", ["salary_component_id"], name: "index_employee_annual_salaries_on_salary_component_id", using: :btree

  create_table "employee_arrear_items", force: :cascade do |t|
    t.integer  "employee_arrear_id",  limit: 4
    t.integer  "salary_component_id", limit: 4
    t.decimal  "actual_amount",                 precision: 15, scale: 2, default: 0.0
    t.decimal  "calculated_amount",             precision: 15, scale: 2, default: 0.0
    t.boolean  "is_deducted"
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

  add_index "employee_arrear_items", ["employee_arrear_id"], name: "index_employee_arrear_items_on_employee_arrear_id", using: :btree
  add_index "employee_arrear_items", ["salary_component_id"], name: "index_employee_arrear_items_on_salary_component_id", using: :btree

  create_table "employee_arrears", force: :cascade do |t|
    t.integer  "employee_id",       limit: 4
    t.boolean  "is_paid",                                              default: false
    t.date     "start_date"
    t.date     "end_date"
    t.date     "paid_date"
    t.decimal  "actual_amount",               precision: 15, scale: 2, default: 0.0
    t.decimal  "calculated_amount",           precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

  add_index "employee_arrears", ["employee_id"], name: "index_employee_arrears_on_employee_id", using: :btree

  create_table "employee_attendances", force: :cascade do |t|
    t.integer  "employee_id",              limit: 4
    t.date     "day"
    t.string   "present",                  limit: 255
    t.datetime "in_time"
    t.datetime "out_time"
    t.integer  "machine_attendance_id",    limit: 4
    t.boolean  "is_confirm",                                                    default: false
    t.integer  "department_id",            limit: 4
    t.decimal  "count",                                precision: 5,  scale: 2
    t.integer  "employee_leav_request_id", limit: 4
    t.integer  "on_duty_request_id",       limit: 4
    t.integer  "company_time_master_id",   limit: 4
    t.string   "working_hrs",              limit: 255
    t.string   "rest_time",                limit: 255
    t.decimal  "difference_hrs",                       precision: 10
    t.decimal  "overtime_hrs",                         precision: 10
    t.decimal  "late_mark",                            precision: 10
    t.string   "month_name",               limit: 255
    t.integer  "employee_code",            limit: 4
    t.string   "employee_name",            limit: 255
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.integer  "holiday_id",               limit: 4
    t.integer  "employee_week_off_id",     limit: 4
    t.string   "comment",                  limit: 255
  end

  add_index "employee_attendances", ["company_time_master_id"], name: "index_employee_attendances_on_company_time_master_id", using: :btree
  add_index "employee_attendances", ["department_id"], name: "index_employee_attendances_on_department_id", using: :btree
  add_index "employee_attendances", ["employee_id"], name: "index_employee_attendances_on_employee_id", using: :btree
  add_index "employee_attendances", ["employee_leav_request_id"], name: "index_employee_attendances_on_employee_leav_request_id", using: :btree
  add_index "employee_attendances", ["employee_week_off_id"], name: "index_employee_attendances_on_employee_week_off_id", using: :btree
  add_index "employee_attendances", ["holiday_id"], name: "index_employee_attendances_on_holiday_id", using: :btree
  add_index "employee_attendances", ["machine_attendance_id"], name: "index_employee_attendances_on_machine_attendance_id", using: :btree
  add_index "employee_attendances", ["on_duty_request_id"], name: "index_employee_attendances_on_on_duty_request_id", using: :btree

  create_table "employee_attributes", force: :cascade do |t|
    t.integer  "attribute_master_id",   limit: 4
    t.integer  "weightage",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "performance_period_id", limit: 4
    t.integer  "employee_id",           limit: 4
    t.boolean  "is_confirm"
    t.string   "emp_head",              limit: 255
  end

  add_index "employee_attributes", ["attribute_master_id"], name: "index_employee_attributes_on_attribute_master_id", using: :btree
  add_index "employee_attributes", ["employee_id"], name: "index_employee_attributes_on_employee_id", using: :btree
  add_index "employee_attributes", ["performance_period_id"], name: "index_employee_attributes_on_performance_period_id", using: :btree

  create_table "employee_bank_details", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.integer  "bank_id",     limit: 4
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

  add_index "employee_bank_details", ["bank_id"], name: "index_employee_bank_details_on_bank_id", using: :btree
  add_index "employee_bank_details", ["employee_id"], name: "index_employee_bank_details_on_employee_id", using: :btree

  create_table "employee_categories", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.boolean  "is_active"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "employee_code_masters", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "range",      limit: 255
    t.string   "last_range", limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employee_daily_activities", force: :cascade do |t|
    t.integer  "employee_id",       limit: 4
    t.integer  "project_master_id", limit: 4
    t.text     "today_activity",    limit: 65535
    t.text     "tomorrow_plan",     limit: 65535
    t.date     "day"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "employee_daily_activities", ["employee_id"], name: "index_employee_daily_activities_on_employee_id", using: :btree
  add_index "employee_daily_activities", ["project_master_id"], name: "index_employee_daily_activities_on_project_master_id", using: :btree

  create_table "employee_designations", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "employee_documents", force: :cascade do |t|
    t.integer  "employee_id",           limit: 4
    t.string   "name",                  limit: 255
    t.boolean  "status"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
    t.string   "image_file_name",       limit: 255
    t.string   "image_content_type",    limit: 255
    t.integer  "image_file_size",       limit: 4
    t.datetime "image_updated_at"
  end

  add_index "employee_documents", ["employee_id"], name: "index_employee_documents_on_employee_id", using: :btree

  create_table "employee_goals", force: :cascade do |t|
    t.integer  "goal_perspective_id",  limit: 4
    t.string   "target",               limit: 255
    t.integer  "goal_weightage",       limit: 4
    t.integer  "difficulty_level",     limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "goal_measure",         limit: 255
    t.integer  "period_id",            limit: 4
    t.integer  "employee_id",          limit: 4
    t.string   "allign_to_supervisor", limit: 255
    t.boolean  "is_confirm"
    t.string   "emp_head",             limit: 255
  end

  add_index "employee_goals", ["employee_id"], name: "index_employee_goals_on_employee_id", using: :btree
  add_index "employee_goals", ["goal_perspective_id"], name: "index_employee_goals_on_goal_perspective_id", using: :btree
  add_index "employee_goals", ["period_id"], name: "index_employee_goals_on_period_id", using: :btree

  create_table "employee_gps", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.string   "location",    limit: 255
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "employee_gps_histories", force: :cascade do |t|
    t.integer  "employee_id",    limit: 4
    t.integer  "employee_gp_id", limit: 4
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.string   "location",       limit: 255
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "member_id",      limit: 4
  end

  add_index "employee_gps_histories", ["employee_gp_id"], name: "index_employee_gps_histories_on_employee_gp_id", using: :btree
  add_index "employee_gps_histories", ["employee_id"], name: "index_employee_gps_histories_on_employee_id", using: :btree
  add_index "employee_gps_histories", ["member_id"], name: "index_employee_gps_histories_on_member_id", using: :btree

  create_table "employee_grades", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "employee_jc_lists", force: :cascade do |t|
    t.integer  "joining_checklist_master_id", limit: 4
    t.integer  "employee_id",                 limit: 4
    t.integer  "admin_id",                    limit: 4
    t.boolean  "status",                                default: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "employee_jc_lists", ["employee_id"], name: "index_employee_jc_lists_on_employee_id", using: :btree
  add_index "employee_jc_lists", ["joining_checklist_master_id"], name: "index_employee_jc_lists_on_joining_checklist_master_id", using: :btree

  create_table "employee_leav_balances", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.integer  "leav_category_id", limit: 4
    t.string   "no_of_leave",      limit: 255
    t.date     "expiry_date"
    t.string   "total_leave",      limit: 255
    t.boolean  "is_confirm"
    t.date     "from_date"
    t.date     "to_date"
    t.boolean  "is_active"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "carry_forward",    limit: 255
    t.string   "leave_count",      limit: 255
    t.string   "collapse_value",   limit: 255
    t.string   "working_day",      limit: 255
  end

  add_index "employee_leav_balances", ["employee_id"], name: "index_employee_leav_balances_on_employee_id", using: :btree
  add_index "employee_leav_balances", ["leav_category_id"], name: "index_employee_leav_balances_on_leav_category_id", using: :btree

  create_table "employee_leav_requests", force: :cascade do |t|
    t.integer  "employee_id",              limit: 4
    t.integer  "leav_category_id",         limit: 4
    t.string   "leave_type",               limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "date_range",               limit: 255
    t.integer  "no_of_day",                limit: 4
    t.decimal  "leave_count",                          precision: 5, scale: 1
    t.boolean  "first_half"
    t.boolean  "last_half"
    t.string   "reason",                   limit: 255
    t.boolean  "is_pending"
    t.boolean  "is_cancelled"
    t.boolean  "is_first_approved"
    t.boolean  "is_second_approved"
    t.boolean  "is_first_rejected"
    t.boolean  "is_second_rejected"
    t.integer  "current_status",           limit: 4
    t.string   "current_status1",          limit: 255
    t.integer  "first_reporter_id",        limit: 4
    t.integer  "second_reporter_id",       limit: 4
    t.boolean  "present_status"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.integer  "employee_leav_balance_id", limit: 4
  end

  add_index "employee_leav_requests", ["employee_id"], name: "index_employee_leav_requests_on_employee_id", using: :btree
  add_index "employee_leav_requests", ["employee_leav_balance_id"], name: "index_employee_leav_requests_on_employee_leav_balance_id", using: :btree
  add_index "employee_leav_requests", ["leav_category_id"], name: "index_employee_leav_requests_on_leav_category_id", using: :btree

  create_table "employee_monthly_days", force: :cascade do |t|
    t.integer  "employee_id",       limit: 4
    t.string   "month",             limit: 255
    t.integer  "year_id",           limit: 4
    t.decimal  "overtime",                      precision: 4, scale: 1
    t.string   "no_of_working_day", limit: 255
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "employee_monthly_days", ["employee_id"], name: "index_employee_monthly_days_on_employee_id", using: :btree
  add_index "employee_monthly_days", ["year_id"], name: "index_employee_monthly_days_on_year_id", using: :btree

  create_table "employee_nominations", force: :cascade do |t|
    t.integer  "nomination_master_id", limit: 4
    t.integer  "family_id",            limit: 4
    t.integer  "employee_id",          limit: 4
    t.integer  "relation_master_id",   limit: 4
    t.decimal  "nomination",                         precision: 10
    t.boolean  "mental_illness"
    t.boolean  "minor"
    t.string   "guardian_name",        limit: 255
    t.boolean  "same_address"
    t.text     "address",              limit: 65535
    t.string   "city",                 limit: 255
    t.integer  "district_id",          limit: 4
    t.integer  "state_id",             limit: 4
    t.integer  "country_id",           limit: 4
    t.integer  "pin_code",             limit: 4
    t.string   "email",                limit: 255
    t.integer  "illness_type_id",      limit: 4
    t.string   "mobile_no",            limit: 255
    t.string   "phone_no",             limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "employee_nominations", ["country_id"], name: "index_employee_nominations_on_country_id", using: :btree
  add_index "employee_nominations", ["district_id"], name: "index_employee_nominations_on_district_id", using: :btree
  add_index "employee_nominations", ["employee_id"], name: "index_employee_nominations_on_employee_id", using: :btree
  add_index "employee_nominations", ["family_id"], name: "index_employee_nominations_on_family_id", using: :btree
  add_index "employee_nominations", ["illness_type_id"], name: "index_employee_nominations_on_illness_type_id", using: :btree
  add_index "employee_nominations", ["nomination_master_id"], name: "index_employee_nominations_on_nomination_master_id", using: :btree
  add_index "employee_nominations", ["relation_master_id"], name: "index_employee_nominations_on_relation_master_id", using: :btree
  add_index "employee_nominations", ["state_id"], name: "index_employee_nominations_on_state_id", using: :btree

  create_table "employee_physicals", force: :cascade do |t|
    t.integer  "employee_id",  limit: 4
    t.string   "height",       limit: 255
    t.string   "weight",       limit: 255
    t.string   "size",         limit: 255
    t.string   "trouser_size", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "employee_physicals", ["employee_id"], name: "index_employee_physicals_on_employee_id", using: :btree

  create_table "employee_promotions", force: :cascade do |t|
    t.string   "designation",             limit: 255
    t.string   "current",                 limit: 255
    t.string   "grade",                   limit: 255
    t.string   "category",                limit: 255
    t.string   "employee_department",     limit: 255
    t.integer  "employee_id",             limit: 4
    t.integer  "department_id",           limit: 4
    t.integer  "employee_designation_id", limit: 4
    t.integer  "employee_grade_id",       limit: 4
    t.string   "employee_category_id",    limit: 255
    t.string   "employee_ctc",            limit: 255
    t.text     "justification",           limit: 65535
    t.date     "effective_from"
    t.date     "effective_to"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "employee_promotions", ["department_id"], name: "index_employee_promotions_on_department_id", using: :btree
  add_index "employee_promotions", ["employee_designation_id"], name: "index_employee_promotions_on_employee_designation_id", using: :btree
  add_index "employee_promotions", ["employee_grade_id"], name: "index_employee_promotions_on_employee_grade_id", using: :btree
  add_index "employee_promotions", ["employee_id"], name: "index_employee_promotions_on_employee_id", using: :btree

  create_table "employee_resignations", force: :cascade do |t|
    t.integer  "employee_id",            limit: 4
    t.date     "resignation_date"
    t.string   "reason",                 limit: 255
    t.boolean  "is_notice_period"
    t.string   "notice_period",          limit: 255
    t.string   "short_notice_period",    limit: 255
    t.date     "tentative_leaving_date"
    t.text     "remark",                 limit: 65535
    t.date     "exit_interview_date"
    t.text     "note",                   limit: 65535
    t.date     "leaving_date"
    t.date     "settled_on"
    t.boolean  "has_left"
    t.boolean  "notice_served"
    t.boolean  "rehired"
    t.string   "resign_status",          limit: 255
    t.integer  "leaving_reason_id",      limit: 4
    t.boolean  "is_stop_pay_request"
    t.integer  "second_reporter_id",     limit: 4
    t.integer  "final_reporter_id",      limit: 4
    t.boolean  "is_pending"
    t.boolean  "is_first_approved"
    t.boolean  "is_second_approved"
    t.boolean  "is_final_approved"
    t.boolean  "is_cancelled"
    t.boolean  "is_first_rejected"
    t.boolean  "is_second_rejected"
    t.boolean  "is_final_rejected"
    t.datetime "application_date"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "reporting_master_id",    limit: 4
  end

  add_index "employee_resignations", ["employee_id"], name: "index_employee_resignations_on_employee_id", using: :btree
  add_index "employee_resignations", ["leaving_reason_id"], name: "index_employee_resignations_on_leaving_reason_id", using: :btree

  create_table "employee_salary_templates", force: :cascade do |t|
    t.integer  "employee_id",                limit: 4
    t.integer  "salary_template_id",         limit: 4
    t.integer  "salary_component_id",        limit: 4
    t.boolean  "is_deducted"
    t.integer  "parent_salary_component_id", limit: 4
    t.decimal  "percentage",                             precision: 15, scale: 2
    t.boolean  "is_taxable"
    t.decimal  "tax",                                    precision: 4,  scale: 2
    t.string   "base",                       limit: 255
    t.string   "to_be_paid",                 limit: 255
    t.decimal  "max_amount",                             precision: 15, scale: 2
    t.decimal  "monthly_amount",                         precision: 15, scale: 2, default: 0.0
    t.decimal  "annual_amount",                          precision: 15, scale: 2, default: 0.0
    t.integer  "employee_template_id",       limit: 4
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
  end

  add_index "employee_salary_templates", ["employee_id"], name: "index_employee_salary_templates_on_employee_id", using: :btree
  add_index "employee_salary_templates", ["employee_template_id"], name: "index_employee_salary_templates_on_employee_template_id", using: :btree
  add_index "employee_salary_templates", ["salary_component_id"], name: "index_employee_salary_templates_on_salary_component_id", using: :btree
  add_index "employee_salary_templates", ["salary_template_id"], name: "index_employee_salary_templates_on_salary_template_id", using: :btree

  create_table "employee_shifts", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "employee_shifts", ["employee_id"], name: "index_employee_shifts_on_employee_id", using: :btree

  create_table "employee_shifts_shift_rotations", force: :cascade do |t|
    t.integer  "shift_rotation_id", limit: 4
    t.integer  "employee_shift_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "employee_shifts_shift_rotations", ["employee_shift_id"], name: "index_employee_shifts_shift_rotations_on_employee_shift_id", using: :btree
  add_index "employee_shifts_shift_rotations", ["shift_rotation_id"], name: "index_employee_shifts_shift_rotations_on_shift_rotation_id", using: :btree

  create_table "employee_task_to_dos", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.text     "task_name",   limit: 65535
    t.date     "task_date"
    t.boolean  "status"
    t.time     "task_time"
    t.datetime "task_time1"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "employee_task_to_dos", ["employee_id"], name: "index_employee_task_to_dos_on_employee_id", using: :btree

  create_table "employee_templates", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.integer  "salary_template_id", limit: 4
    t.decimal  "gross_salary",                 precision: 10
    t.boolean  "is_active",                                   default: true
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "employee_templates", ["employee_id"], name: "index_employee_templates_on_employee_id", using: :btree
  add_index "employee_templates", ["salary_template_id"], name: "index_employee_templates_on_salary_template_id", using: :btree

  create_table "employee_transfers", force: :cascade do |t|
    t.integer  "employee_id",               limit: 4
    t.integer  "employee_designation_id",   limit: 4
    t.integer  "employee_category_id",      limit: 4
    t.integer  "company_id",                limit: 4
    t.integer  "company_location_id",       limit: 4
    t.integer  "department_id",             limit: 4
    t.string   "designation",               limit: 255
    t.string   "string",                    limit: 255
    t.string   "category",                  limit: 255
    t.string   "employee_company",          limit: 255
    t.string   "employee_company_location", limit: 255
    t.string   "employee_department",       limit: 255
    t.string   "current_status",            limit: 255
    t.text     "justification",             limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.date     "effective_from"
    t.date     "effective_to"
    t.integer  "reporting_master_id",       limit: 4
  end

  add_index "employee_transfers", ["company_id"], name: "index_employee_transfers_on_company_id", using: :btree
  add_index "employee_transfers", ["company_location_id"], name: "index_employee_transfers_on_company_location_id", using: :btree
  add_index "employee_transfers", ["department_id"], name: "index_employee_transfers_on_department_id", using: :btree
  add_index "employee_transfers", ["employee_category_id"], name: "index_employee_transfers_on_employee_category_id", using: :btree
  add_index "employee_transfers", ["employee_designation_id"], name: "index_employee_transfers_on_employee_designation_id", using: :btree
  add_index "employee_transfers", ["employee_id"], name: "index_employee_transfers_on_employee_id", using: :btree

  create_table "employee_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "employee_week_offs", force: :cascade do |t|
    t.integer  "week_off_master_id", limit: 4
    t.integer  "employee_id",        limit: 4
    t.string   "day",                limit: 255
    t.date     "date"
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "employee_week_offs", ["employee_id"], name: "index_employee_week_offs_on_employee_id", using: :btree
  add_index "employee_week_offs", ["week_off_master_id"], name: "index_employee_week_offs_on_week_off_master_id", using: :btree

  create_table "employeer_esics", force: :cascade do |t|
    t.date     "esic_date"
    t.decimal  "amount",                  precision: 10
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "employee_id",   limit: 4
    t.decimal  "actual_amount",           precision: 10
  end

  add_index "employeer_esics", ["employee_id"], name: "index_employeer_esics_on_employee_id", using: :btree

  create_table "employeer_pfs", force: :cascade do |t|
    t.integer  "employee_id",   limit: 4
    t.date     "pf_date"
    t.decimal  "amount",                  precision: 10
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.decimal  "actual_amount",           precision: 10
  end

  add_index "employeer_pfs", ["employee_id"], name: "index_employeer_pfs_on_employee_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "manual_employee_code",            limit: 255
    t.string   "employee_code",                   limit: 255
    t.string   "employees",                       limit: 255
    t.string   "prefix",                          limit: 255
    t.string   "first_name",                      limit: 255
    t.string   "middle_name",                     limit: 255
    t.string   "last_name",                       limit: 255
    t.date     "date_of_birth"
    t.string   "gender",                          limit: 255
    t.string   "contact_no",                      limit: 255
    t.string   "optinal_contact_no",              limit: 255
    t.string   "email",                           limit: 255
    t.text     "permanent_address",               limit: 65535
    t.integer  "country_id",                      limit: 4
    t.integer  "state_id",                        limit: 4
    t.integer  "district_id",                     limit: 4
    t.string   "city",                            limit: 255
    t.integer  "pin_code",                        limit: 4
    t.text     "current_address",                 limit: 65535
    t.string   "adhar_no",                        limit: 255
    t.string   "pan_no",                          limit: 255
    t.string   "licence_no",                      limit: 255
    t.string   "marital_status",                  limit: 255
    t.integer  "blood_group_id",                  limit: 4
    t.integer  "employee_type_id",                limit: 4
    t.integer  "nationality_id",                  limit: 4
    t.integer  "religion_id",                     limit: 4
    t.string   "handicap",                        limit: 255
    t.string   "handicap_type",                   limit: 255
    t.string   "status",                          limit: 255
    t.integer  "manager_id",                      limit: 4
    t.integer  "manager_2_id",                    limit: 4
    t.integer  "company_id",                      limit: 4
    t.integer  "company_location_id",             limit: 4
    t.integer  "department_id",                   limit: 4
    t.integer  "punch_card_id",                   limit: 4
    t.integer  "employee_code_master_id",         limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "passport_photo_file_name",        limit: 255
    t.string   "passport_photo_content_type",     limit: 255
    t.integer  "passport_photo_file_size",        limit: 4
    t.datetime "passport_photo_updated_at"
    t.string   "optional_email",                  limit: 255
    t.integer  "sub_department_id",               limit: 4
    t.string   "employee_signature_file_name",    limit: 255
    t.string   "employee_signature_content_type", limit: 255
    t.integer  "employee_signature_file_size",    limit: 4
    t.datetime "employee_signature_updated_at"
    t.string   "emergency_contact_no",            limit: 255
  end

  add_index "employees", ["blood_group_id"], name: "index_employees_on_blood_group_id", using: :btree
  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree
  add_index "employees", ["company_location_id"], name: "index_employees_on_company_location_id", using: :btree
  add_index "employees", ["country_id"], name: "index_employees_on_country_id", using: :btree
  add_index "employees", ["department_id"], name: "index_employees_on_department_id", using: :btree
  add_index "employees", ["district_id"], name: "index_employees_on_district_id", using: :btree
  add_index "employees", ["employee_code"], name: "index_employees_on_employee_code", using: :btree
  add_index "employees", ["employee_code_master_id"], name: "index_employees_on_employee_code_master_id", using: :btree
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id", using: :btree
  add_index "employees", ["nationality_id"], name: "index_employees_on_nationality_id", using: :btree
  add_index "employees", ["religion_id"], name: "index_employees_on_religion_id", using: :btree
  add_index "employees", ["state_id"], name: "index_employees_on_state_id", using: :btree
  add_index "employees", ["sub_department_id"], name: "index_employees_on_sub_department_id", using: :btree

  create_table "employer_contributions", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.date     "date"
    t.decimal  "actual_pf",                  precision: 10
    t.decimal  "pf",                         precision: 10
    t.decimal  "actual_esic",                precision: 10
    t.decimal  "esic",                       precision: 10
    t.decimal  "actual_fp",                  precision: 10
    t.decimal  "fp",                         precision: 10
    t.decimal  "actual_insurance",           precision: 10
    t.decimal  "insurance",                  precision: 10
    t.decimal  "actual_bonus",               precision: 10
    t.decimal  "bonus",                      precision: 10
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "employer_contributions", ["employee_id"], name: "index_employer_contributions_on_employee_id", using: :btree

  create_table "employer_family_pensions", force: :cascade do |t|
    t.string   "base_component", limit: 255
    t.decimal  "percentage",                 precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "employer_insurances", force: :cascade do |t|
    t.string   "base_component", limit: 255
    t.decimal  "percentage",                 precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "esic_employer_masters", force: :cascade do |t|
    t.boolean  "esic"
    t.decimal  "percentage",                 precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.decimal  "max_limit",                  precision: 10
    t.string   "base_component", limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "esic_employers", force: :cascade do |t|
    t.string   "base_component", limit: 255
    t.decimal  "percentage",                 precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "esic_masters", force: :cascade do |t|
    t.boolean  "esic"
    t.decimal  "percentage",                 precision: 15, scale: 2, default: 0.0
    t.decimal  "decimal",                    precision: 15, scale: 2, default: 0.0
    t.date     "date_effective"
    t.decimal  "max_limit",                  precision: 15, scale: 2, default: 0.0
    t.string   "base_component", limit: 255
    t.date     "to_date"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
  end

  create_table "excel_uploads", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "file_name",  limit: 255
    t.string   "size",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "exit_interviews", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.integer  "question_master_id",      limit: 4
    t.text     "answer",                  limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "employee_resignation_id", limit: 4
  end

  add_index "exit_interviews", ["employee_id"], name: "index_exit_interviews_on_employee_id", using: :btree
  add_index "exit_interviews", ["employee_resignation_id"], name: "index_exit_interviews_on_employee_resignation_id", using: :btree
  add_index "exit_interviews", ["question_master_id"], name: "index_exit_interviews_on_question_master_id", using: :btree

  create_table "expencess_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "employee_id",  limit: 4
    t.string   "company_name", limit: 255
    t.string   "designation",  limit: 255
    t.string   "no_of_year",   limit: 255
    t.string   "ctc",          limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "experiences", ["employee_id"], name: "index_experiences_on_employee_id", using: :btree

  create_table "f_designations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.integer  "employee_id",          limit: 4
    t.string   "no_of_member",         limit: 255
    t.string   "f_name",               limit: 255
    t.string   "m_name",               limit: 255
    t.string   "l_name",               limit: 255
    t.string   "gender",               limit: 255
    t.date     "date_of_birth"
    t.integer  "age",                  limit: 4
    t.string   "contact_no",           limit: 255
    t.string   "email",                limit: 255
    t.text     "current_address",      limit: 65535
    t.string   "marital",              limit: 255
    t.string   "relation",             limit: 255
    t.string   "profession",           limit: 255
    t.string   "adhar_no",             limit: 255
    t.string   "pan_no",               limit: 255
    t.string   "have_passport",        limit: 255
    t.string   "passport_no",          limit: 255
    t.date     "passport_issue_date"
    t.date     "passport_expiry_date"
    t.string   "medical_claim",        limit: 255
    t.integer  "blood_group_id",       limit: 4
    t.string   "is_handicap",          limit: 255
    t.string   "handicap_type",        limit: 255
    t.integer  "religion_id",          limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "relation_master_id",   limit: 4
  end

  add_index "families", ["blood_group_id"], name: "index_families_on_blood_group_id", using: :btree
  add_index "families", ["employee_id"], name: "index_families_on_employee_id", using: :btree
  add_index "families", ["relation_master_id"], name: "index_families_on_relation_master_id", using: :btree
  add_index "families", ["religion_id"], name: "index_families_on_religion_id", using: :btree

  create_table "final_ratings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "final_reporters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "first_reporters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_coupan_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.decimal  "price",                   precision: 15, scale: 2, default: 0.0
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "food_deductions", force: :cascade do |t|
    t.date     "food_date"
    t.integer  "no_of_coupan",          limit: 4
    t.integer  "food_coupan_master_id", limit: 4
    t.decimal  "amount",                          precision: 15, scale: 2, default: 0.0
    t.integer  "employee_id",           limit: 4
    t.integer  "return_coupan",         limit: 4
    t.integer  "total_coupan",          limit: 4
    t.boolean  "is_paid"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
  end

  add_index "food_deductions", ["employee_id"], name: "index_food_deductions_on_employee_id", using: :btree
  add_index "food_deductions", ["food_coupan_master_id"], name: "index_food_deductions_on_food_coupan_master_id", using: :btree

  create_table "fp_masters", force: :cascade do |t|
    t.boolean  "is_fp"
    t.decimal  "min_limit",                  precision: 10
    t.decimal  "percentage",                 precision: 10
    t.string   "base_component", limit: 255
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "goal_bunches", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.boolean  "goal_confirm"
    t.boolean  "goal_approval"
    t.integer  "appraisee_id",            limit: 4
    t.string   "appraisee_rating_id",     limit: 255
    t.text     "appraisee_comment",       limit: 65535
    t.boolean  "appraisee_confirm"
    t.integer  "appraiser_id",            limit: 4
    t.string   "appraiser_rating",        limit: 255
    t.text     "appraiser_comment",       limit: 65535
    t.boolean  "appraiser_confirm"
    t.integer  "reviewer_id",             limit: 4
    t.text     "review_comment",          limit: 65535
    t.integer  "reviewer_rating_id",      limit: 4
    t.boolean  "reviewer_confirm"
    t.boolean  "r_promotion"
    t.boolean  "r_increment"
    t.integer  "r_designation_id",        limit: 4
    t.decimal  "r_ctc",                                 precision: 10
    t.integer  "final_id",                limit: 4
    t.text     "final_comment",           limit: 65535
    t.integer  "final_rating_id",         limit: 4
    t.boolean  "final_confirm"
    t.boolean  "f_promotion"
    t.boolean  "f_increment"
    t.integer  "f_designation_id",        limit: 4
    t.decimal  "f_ctc",                                 precision: 10
    t.integer  "performance_calendar_id", limit: 4
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "period_id",               limit: 4
  end

  add_index "goal_bunches", ["employee_id"], name: "index_goal_bunches_on_employee_id", using: :btree
  add_index "goal_bunches", ["performance_calendar_id"], name: "index_goal_bunches_on_performance_calendar_id", using: :btree
  add_index "goal_bunches", ["period_id"], name: "index_goal_bunches_on_period_id", using: :btree

  create_table "goal_measures", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "goal_perspectives", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.boolean  "goal_weightage"
    t.integer  "from",           limit: 4
    t.integer  "to",             limit: 4
    t.boolean  "is_confirm"
    t.boolean  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "goal_rating_sheets", force: :cascade do |t|
    t.integer  "appraisee_id",          limit: 4
    t.integer  "appraiser_id",          limit: 4
    t.integer  "employee_goal_id",      limit: 4
    t.boolean  "allign_to_supervisor"
    t.text     "appraisee_comment",     limit: 65535
    t.text     "appraiser_comment",     limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "performance_period_id", limit: 4
    t.boolean  "is_confirm_appraiser"
    t.boolean  "is_confirm_appraisee"
    t.text     "appraiser2_comment",    limit: 65535
    t.text     "final_comment",         limit: 65535
    t.integer  "appraiser_2_id",        limit: 4
    t.integer  "final_id_id",           limit: 4
    t.boolean  "is_confirm_final"
    t.boolean  "is_confirm_appraiser2"
    t.integer  "appraisee_rating_id",   limit: 4
    t.integer  "appraiser_rating_id",   limit: 4
    t.integer  "appraiser2_rating_id",  limit: 4
    t.integer  "final_rating_id",       limit: 4
  end

  add_index "goal_rating_sheets", ["appraisee_id"], name: "index_goal_rating_sheets_on_appraisee_id", using: :btree
  add_index "goal_rating_sheets", ["appraisee_rating_id"], name: "index_goal_rating_sheets_on_appraisee_rating_id", using: :btree
  add_index "goal_rating_sheets", ["appraiser2_rating_id"], name: "index_goal_rating_sheets_on_appraiser2_rating_id", using: :btree
  add_index "goal_rating_sheets", ["appraiser_2_id"], name: "index_goal_rating_sheets_on_appraiser_2_id", using: :btree
  add_index "goal_rating_sheets", ["appraiser_id"], name: "index_goal_rating_sheets_on_appraiser_id", using: :btree
  add_index "goal_rating_sheets", ["appraiser_rating_id"], name: "index_goal_rating_sheets_on_appraiser_rating_id", using: :btree
  add_index "goal_rating_sheets", ["employee_goal_id"], name: "index_goal_rating_sheets_on_employee_goal_id", using: :btree
  add_index "goal_rating_sheets", ["final_id_id"], name: "index_goal_rating_sheets_on_final_id_id", using: :btree
  add_index "goal_rating_sheets", ["final_rating_id"], name: "index_goal_rating_sheets_on_final_rating_id", using: :btree
  add_index "goal_rating_sheets", ["performance_period_id"], name: "index_goal_rating_sheets_on_performance_period_id", using: :btree

  create_table "goal_ratings", force: :cascade do |t|
    t.integer  "goal_bunch_id",            limit: 4
    t.integer  "period_id",                limit: 4
    t.string   "goal_type",                limit: 255
    t.integer  "goal_perspective_id",      limit: 4
    t.integer  "attribute_master_id",      limit: 4
    t.integer  "goal_weightage",           limit: 4
    t.text     "goal_measure",             limit: 65535
    t.text     "target",                   limit: 65535
    t.string   "aligned",                  limit: 255
    t.integer  "goal_setter_id",           limit: 4
    t.integer  "appraisee_id",             limit: 4
    t.text     "appraisee_comment",        limit: 65535
    t.integer  "appraiser_id",             limit: 4
    t.text     "appraiser_comment",        limit: 65535
    t.integer  "appraiser_rating_id",      limit: 4
    t.integer  "reviewer_id",              limit: 4
    t.text     "reviewer_comment",         limit: 65535
    t.integer  "performance_calendar_id",  limit: 4
    t.integer  "training_topic_master_id", limit: 4
    t.boolean  "is_assigned"
    t.boolean  "is_hide"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "appraisee_rating_id",      limit: 4
  end

  add_index "goal_ratings", ["attribute_master_id"], name: "index_goal_ratings_on_attribute_master_id", using: :btree
  add_index "goal_ratings", ["goal_bunch_id"], name: "index_goal_ratings_on_goal_bunch_id", using: :btree
  add_index "goal_ratings", ["goal_perspective_id"], name: "index_goal_ratings_on_goal_perspective_id", using: :btree
  add_index "goal_ratings", ["performance_calendar_id"], name: "index_goal_ratings_on_performance_calendar_id", using: :btree
  add_index "goal_ratings", ["period_id"], name: "index_goal_ratings_on_period_id", using: :btree
  add_index "goal_ratings", ["training_topic_master_id"], name: "index_goal_ratings_on_training_topic_master_id", using: :btree

  create_table "goal_setters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gps_dailies", force: :cascade do |t|
    t.integer  "employee_id",    limit: 4
    t.integer  "employee_gp_id", limit: 4
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.string   "location",       limit: 255
    t.date     "date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "gps_dailies", ["employee_gp_id"], name: "index_gps_dailies_on_employee_gp_id", using: :btree
  add_index "gps_dailies", ["employee_id"], name: "index_gps_dailies_on_employee_id", using: :btree

  create_table "gratuities", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.integer  "gratuity_master_id", limit: 4
    t.decimal  "gratuity_amount",                precision: 10
    t.string   "no_of_year",         limit: 255
    t.decimal  "total_gratuity",                 precision: 10
    t.date     "day"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "gratuities", ["employee_id"], name: "index_gratuities_on_employee_id", using: :btree
  add_index "gratuities", ["gratuity_master_id"], name: "index_gratuities_on_gratuity_master_id", using: :btree

  create_table "gratuity_masters", force: :cascade do |t|
    t.string   "no_of_year",     limit: 255
    t.string   "base_component", limit: 255
    t.integer  "day_in_month",   limit: 4
    t.string   "payable_day",    limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "greetings", force: :cascade do |t|
    t.date     "date"
    t.integer  "sender_id",                   limit: 4
    t.integer  "receiver_id",                 limit: 4
    t.text     "message",                     limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "greeting_type",               limit: 255
    t.string   "birthday_image_file_name",    limit: 255
    t.string   "birthday_image_content_type", limit: 255
    t.integer  "birthday_image_file_size",    limit: 4
    t.datetime "birthday_image_updated_at"
  end

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
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "groups", ["email"], name: "index_groups_on_email", unique: true, using: :btree
  add_index "groups", ["reset_password_token"], name: "index_groups_on_reset_password_token", unique: true, using: :btree
  add_index "groups", ["subdomain"], name: "index_groups_on_subdomain", unique: true, using: :btree

  create_table "holidays", force: :cascade do |t|
    t.string   "code",         limit: 255
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.date     "holiday_date"
    t.boolean  "isweekend"
    t.boolean  "is_send",                    default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "c_off"
    t.string   "holiday_type", limit: 255
  end

  create_table "illness_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "induction_activities", force: :cascade do |t|
    t.text     "activity",            limit: 65535
    t.string   "day",                 limit: 255
    t.string   "duration",            limit: 255
    t.integer  "employee_id",         limit: 4
    t.integer  "induction_master_id", limit: 4
    t.date     "activity_date"
    t.time     "from"
    t.time     "to"
    t.text     "program_agenda",      limit: 65535
    t.date     "start_date"
    t.boolean  "induction_completed"
    t.text     "facilitator_1",       limit: 65535
    t.text     "facilitator_2",       limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.boolean  "is_confirm"
  end

  add_index "induction_activities", ["employee_id"], name: "index_induction_activities_on_employee_id", using: :btree
  add_index "induction_activities", ["induction_master_id"], name: "index_induction_activities_on_induction_master_id", using: :btree

  create_table "induction_details", force: :cascade do |t|
    t.integer  "employee_id",         limit: 4
    t.date     "start_date"
    t.integer  "induction_master_id", limit: 4
    t.boolean  "induction_completed"
    t.date     "end_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "induction_details", ["employee_id"], name: "index_induction_details_on_employee_id", using: :btree
  add_index "induction_details", ["induction_master_id"], name: "index_induction_details_on_induction_master_id", using: :btree

  create_table "induction_masters", force: :cascade do |t|
    t.string   "code",                limit: 255
    t.text     "description",         limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  create_table "induction_templates", force: :cascade do |t|
    t.string   "template_no", limit: 255
    t.text     "description", limit: 65535
    t.text     "activity",    limit: 65535
    t.integer  "day",         limit: 4
    t.integer  "duration",    limit: 4
    t.integer  "employee_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "induction_templates", ["employee_id"], name: "index_induction_templates_on_employee_id", using: :btree

  create_table "instalments", force: :cascade do |t|
    t.integer  "advance_salary_id", limit: 4
    t.date     "instalment_date"
    t.decimal  "instalment_amount",           precision: 15, scale: 2
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.boolean  "is_complete",                                          default: false
  end

  add_index "instalments", ["advance_salary_id"], name: "index_instalments_on_advance_salary_id", using: :btree

  create_table "insurance_masters", force: :cascade do |t|
    t.boolean  "is_insurance"
    t.decimal  "percentage",                 precision: 10
    t.string   "base_component", limit: 255
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "interview_analyses", force: :cascade do |t|
    t.integer  "vacancy_request_history_id", limit: 4
    t.integer  "interview_evalution_id",     limit: 4
    t.integer  "interview_attribute_id",     limit: 4
    t.integer  "interview_decision_id",      limit: 4
    t.integer  "interview_schedule_id",      limit: 4
    t.integer  "interview_round_id",         limit: 4
    t.text     "comment",                    limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "interview_analyses", ["interview_attribute_id"], name: "index_interview_analyses_on_interview_attribute_id", using: :btree
  add_index "interview_analyses", ["interview_decision_id"], name: "index_interview_analyses_on_interview_decision_id", using: :btree
  add_index "interview_analyses", ["interview_evalution_id"], name: "index_interview_analyses_on_interview_evalution_id", using: :btree
  add_index "interview_analyses", ["interview_round_id"], name: "index_interview_analyses_on_interview_round_id", using: :btree
  add_index "interview_analyses", ["interview_schedule_id"], name: "index_interview_analyses_on_interview_schedule_id", using: :btree
  add_index "interview_analyses", ["vacancy_request_history_id"], name: "index_interview_analyses_on_vacancy_request_history_id", using: :btree

  create_table "interview_attributes", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "interview_decisions", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.integer  "name",        limit: 4
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "interview_evalutions", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "interview_reschedules", force: :cascade do |t|
    t.date     "interview_date"
    t.time     "interview_time"
    t.integer  "interview_schedule_id", limit: 4
    t.integer  "employee_id",           limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "interview_reschedules", ["employee_id"], name: "index_interview_reschedules_on_employee_id", using: :btree
  add_index "interview_reschedules", ["interview_schedule_id"], name: "index_interview_reschedules_on_interview_schedule_id", using: :btree

  create_table "interview_round_reschedules", force: :cascade do |t|
    t.integer  "interview_round_id", limit: 4
    t.integer  "employee_id",        limit: 4
    t.integer  "interview_type_id",  limit: 4
    t.date     "interview_date"
    t.time     "interview_time"
    t.string   "location",           limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "interview_round_reschedules", ["employee_id"], name: "index_interview_round_reschedules_on_employee_id", using: :btree
  add_index "interview_round_reschedules", ["interview_round_id"], name: "index_interview_round_reschedules_on_interview_round_id", using: :btree
  add_index "interview_round_reschedules", ["interview_type_id"], name: "index_interview_round_reschedules_on_interview_type_id", using: :btree

  create_table "interview_rounds", force: :cascade do |t|
    t.integer  "interview_schedule_id",   limit: 4
    t.integer  "employee_id",             limit: 4
    t.integer  "interview_type_id",       limit: 4
    t.date     "interview_date"
    t.time     "interview_time"
    t.string   "location",                limit: 255
    t.text     "schedule_comment",        limit: 65535
    t.boolean  "is_confirm"
    t.boolean  "interview_round_confirm"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "interview_rounds", ["employee_id"], name: "index_interview_rounds_on_employee_id", using: :btree
  add_index "interview_rounds", ["interview_schedule_id"], name: "index_interview_rounds_on_interview_schedule_id", using: :btree
  add_index "interview_rounds", ["interview_type_id"], name: "index_interview_rounds_on_interview_type_id", using: :btree

  create_table "interview_schedules", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.integer  "selected_resume_id", limit: 4
    t.string   "email_id",           limit: 255
    t.string   "candidate_name",     limit: 255
    t.date     "interview_date"
    t.string   "location",           limit: 255
    t.string   "post_title",         limit: 255
    t.string   "job_title",          limit: 255
    t.boolean  "is_confirm"
    t.string   "candidate_name2",    limit: 255
    t.text     "address",            limit: 65535
    t.boolean  "is_confirmed"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "interview_schedules", ["employee_id"], name: "index_interview_schedules_on_employee_id", using: :btree
  add_index "interview_schedules", ["selected_resume_id"], name: "index_interview_schedules_on_selected_resume_id", using: :btree

  create_table "interview_type_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "interview_types", force: :cascade do |t|
    t.integer  "code",        limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "investment_declarations", force: :cascade do |t|
    t.date     "date"
    t.integer  "investment_head_id",    limit: 4
    t.decimal  "amount",                              precision: 10
    t.integer  "employee_id",           limit: 4
    t.boolean  "status"
    t.boolean  "is_confirm",                                         default: false
    t.text     "comment",               limit: 65535
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  add_index "investment_declarations", ["employee_id"], name: "index_investment_declarations_on_employee_id", using: :btree
  add_index "investment_declarations", ["investment_head_id"], name: "index_investment_declarations_on_investment_head_id", using: :btree

  create_table "investment_heads", force: :cascade do |t|
    t.integer  "section_id",    limit: 4
    t.text     "description",   limit: 65535
    t.decimal  "limit",                       precision: 10
    t.string   "document_name", limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "investment_heads", ["section_id"], name: "index_investment_heads_on_section_id", using: :btree

  create_table "issue_histories", force: :cascade do |t|
    t.integer  "issue_request_id",        limit: 4
    t.integer  "issue_master_id",         limit: 4
    t.string   "description",             limit: 255
    t.date     "date"
    t.time     "time"
    t.integer  "employee_id",             limit: 4
    t.integer  "issue_tracker_member_id", limit: 4
    t.integer  "issue_tracker_group_id",  limit: 4
    t.string   "issue_priority",          limit: 255
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "issue_histories", ["employee_id"], name: "index_issue_histories_on_employee_id", using: :btree
  add_index "issue_histories", ["issue_master_id"], name: "index_issue_histories_on_issue_master_id", using: :btree
  add_index "issue_histories", ["issue_request_id"], name: "index_issue_histories_on_issue_request_id", using: :btree
  add_index "issue_histories", ["issue_tracker_group_id"], name: "index_issue_histories_on_issue_tracker_group_id", using: :btree
  add_index "issue_histories", ["issue_tracker_member_id"], name: "index_issue_histories_on_issue_tracker_member_id", using: :btree

  create_table "issue_locker_histories", force: :cascade do |t|
    t.integer  "issue_locker_id",         limit: 4
    t.integer  "issue_request_id",        limit: 4
    t.integer  "issue_tracker_member_id", limit: 4
    t.boolean  "status"
    t.date     "lock_date"
    t.time     "lock_time"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "issue_locker_histories", ["issue_locker_id"], name: "index_issue_locker_histories_on_issue_locker_id", using: :btree
  add_index "issue_locker_histories", ["issue_request_id"], name: "index_issue_locker_histories_on_issue_request_id", using: :btree
  add_index "issue_locker_histories", ["issue_tracker_member_id"], name: "index_issue_locker_histories_on_issue_tracker_member_id", using: :btree

  create_table "issue_lockers", force: :cascade do |t|
    t.integer  "issue_request_id",        limit: 4
    t.integer  "issue_tracker_member_id", limit: 4
    t.boolean  "status"
    t.date     "lock_date"
    t.time     "lock_time"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "issue_lockers", ["issue_request_id"], name: "index_issue_lockers_on_issue_request_id", using: :btree
  add_index "issue_lockers", ["issue_tracker_member_id"], name: "index_issue_lockers_on_issue_tracker_member_id", using: :btree

  create_table "issue_masters", force: :cascade do |t|
    t.integer  "issue_tracker_group_id", limit: 4
    t.integer  "issue_type_id",          limit: 4
    t.string   "name",                   limit: 255
    t.string   "role",                   limit: 255
    t.string   "description",            limit: 255
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "issue_masters", ["issue_tracker_group_id"], name: "index_issue_masters_on_issue_tracker_group_id", using: :btree
  add_index "issue_masters", ["issue_type_id"], name: "index_issue_masters_on_issue_type_id", using: :btree

  create_table "issue_requests", force: :cascade do |t|
    t.integer  "issue_master_id",         limit: 4
    t.integer  "issue_tracker_member_id", limit: 4
    t.integer  "issue_tracker_group_id",  limit: 4
    t.string   "description",             limit: 255
    t.date     "date"
    t.time     "time"
    t.integer  "employee_id",             limit: 4
    t.string   "issue_priority",          limit: 255
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.integer  "issue_root_cause_id",     limit: 4
    t.string   "effort_time",             limit: 255
    t.string   "comment",                 limit: 255
    t.boolean  "is_complete"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "document1_file_name",     limit: 255
    t.string   "document1_content_type",  limit: 255
    t.integer  "document1_file_size",     limit: 4
    t.datetime "document1_updated_at"
    t.string   "document2_file_name",     limit: 255
    t.string   "document2_content_type",  limit: 255
    t.integer  "document2_file_size",     limit: 4
    t.datetime "document2_updated_at"
  end

  add_index "issue_requests", ["employee_id"], name: "index_issue_requests_on_employee_id", using: :btree
  add_index "issue_requests", ["issue_master_id"], name: "index_issue_requests_on_issue_master_id", using: :btree
  add_index "issue_requests", ["issue_root_cause_id"], name: "index_issue_requests_on_issue_root_cause_id", using: :btree
  add_index "issue_requests", ["issue_tracker_group_id"], name: "index_issue_requests_on_issue_tracker_group_id", using: :btree
  add_index "issue_requests", ["issue_tracker_member_id"], name: "index_issue_requests_on_issue_tracker_member_id", using: :btree

  create_table "issue_root_causes", force: :cascade do |t|
    t.integer  "issue_tracker_group_id", limit: 4
    t.string   "name",                   limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "issue_root_causes", ["issue_tracker_group_id"], name: "index_issue_root_causes_on_issue_tracker_group_id", using: :btree

  create_table "issue_tracker_accesses", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "role",                   limit: 255
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.integer  "issue_tracker_group_id", limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "issue_tracker_accesses", ["issue_tracker_group_id"], name: "index_issue_tracker_accesses_on_issue_tracker_group_id", using: :btree

  create_table "issue_tracker_groups", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "email",          limit: 255
    t.string   "contact_number", limit: 255
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "issue_tracker_members", force: :cascade do |t|
    t.integer  "issue_tracker_group_id", limit: 4
    t.integer  "employee_id",            limit: 4
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "role",                   limit: 255
  end

  add_index "issue_tracker_members", ["employee_id"], name: "index_issue_tracker_members_on_employee_id", using: :btree
  add_index "issue_tracker_members", ["issue_tracker_group_id"], name: "index_issue_tracker_members_on_issue_tracker_group_id", using: :btree

  create_table "issue_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "joining_checklist_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status",                    default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "joining_details", force: :cascade do |t|
    t.integer  "employee_id",                   limit: 4
    t.date     "joining_date"
    t.integer  "employee_grade_id",             limit: 4
    t.integer  "employee_designation_id",       limit: 4
    t.date     "confirmation_date"
    t.string   "status",                        limit: 255
    t.string   "employee_uan_no",               limit: 255
    t.string   "employee_pf_no",                limit: 255
    t.string   "employee_efic_no",              limit: 255
    t.string   "probation_period",              limit: 255
    t.string   "notice_period",                 limit: 255
    t.boolean  "is_mediclaim"
    t.string   "medical_schem",                 limit: 255
    t.string   "have_passport",                 limit: 255
    t.string   "passport_no",                   limit: 255
    t.date     "passport_issue_date"
    t.date     "passport_expiry_date"
    t.boolean  "is_society_member"
    t.date     "retirement_date"
    t.date     "date"
    t.integer  "reserved_category_id",          limit: 4
    t.string   "select_pf",                     limit: 255
    t.string   "pf_max_amount",                 limit: 255
    t.boolean  "have_esic"
    t.integer  "cost_center_id",                limit: 4
    t.integer  "employee_category_id",          limit: 4
    t.integer  "payment_mode_id",               limit: 4
    t.string   "ot_rate",                       limit: 255
    t.boolean  "ot_option"
    t.boolean  "is_new",                                    default: true
    t.integer  "replacement_id",                limit: 4
    t.boolean  "have_retention"
    t.boolean  "is_employeer_pf"
    t.boolean  "is_employeer_esic"
    t.boolean  "is_insurance"
    t.boolean  "is_family_pension"
    t.boolean  "is_bonus"
    t.boolean  "basis_of_time",                             default: false
    t.boolean  "time_master"
    t.boolean  "time_adjusted"
    t.date     "leaving_date"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "notice_period_after_probation", limit: 255
    t.boolean  "c_off"
  end

  add_index "joining_details", ["cost_center_id"], name: "index_joining_details_on_cost_center_id", using: :btree
  add_index "joining_details", ["employee_category_id"], name: "index_joining_details_on_employee_category_id", using: :btree
  add_index "joining_details", ["employee_designation_id"], name: "index_joining_details_on_employee_designation_id", using: :btree
  add_index "joining_details", ["employee_grade_id"], name: "index_joining_details_on_employee_grade_id", using: :btree
  add_index "joining_details", ["employee_id"], name: "index_joining_details_on_employee_id", using: :btree
  add_index "joining_details", ["payment_mode_id"], name: "index_joining_details_on_payment_mode_id", using: :btree
  add_index "joining_details", ["reserved_category_id"], name: "index_joining_details_on_reserved_category_id", using: :btree

  create_table "late_mark_masters", force: :cascade do |t|
    t.string   "from",       limit: 255
    t.string   "to",         limit: 255
    t.string   "late_mark",  limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "leav_approveds", force: :cascade do |t|
    t.integer  "employee_leav_request_id", limit: 4
    t.datetime "approved_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "employee_id",              limit: 4
  end

  add_index "leav_approveds", ["employee_id"], name: "index_leav_approveds_on_employee_id", using: :btree
  add_index "leav_approveds", ["employee_leav_request_id"], name: "index_leav_approveds_on_employee_leav_request_id", using: :btree

  create_table "leav_cancelleds", force: :cascade do |t|
    t.integer  "employee_leav_request_id", limit: 4
    t.datetime "cancelled_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "employee_id",              limit: 4
  end

  add_index "leav_cancelleds", ["employee_id"], name: "index_leav_cancelleds_on_employee_id", using: :btree
  add_index "leav_cancelleds", ["employee_leav_request_id"], name: "index_leav_cancelleds_on_employee_leav_request_id", using: :btree

  create_table "leav_categories", force: :cascade do |t|
    t.string   "code",             limit: 255
    t.string   "name",             limit: 255
    t.string   "description",      limit: 255
    t.boolean  "is_confirm"
    t.boolean  "is_payble"
    t.decimal  "from",                         precision: 10
    t.decimal  "to",                           precision: 10
    t.boolean  "is_active"
    t.boolean  "is_balance"
    t.string   "limit",            limit: 255
    t.boolean  "is_limit"
    t.boolean  "is_cashable"
    t.boolean  "assign_balance"
    t.boolean  "is_continuous"
    t.decimal  "monthly_leave",                precision: 10
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "weekoff_sandwich"
    t.boolean  "holiday_sandwich"
    t.boolean  "transfer"
  end

  create_table "leav_rejecteds", force: :cascade do |t|
    t.integer  "employee_leav_request_id", limit: 4
    t.datetime "rejected_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "employee_id",              limit: 4
  end

  add_index "leav_rejecteds", ["employee_id"], name: "index_leav_rejecteds_on_employee_id", using: :btree
  add_index "leav_rejecteds", ["employee_leav_request_id"], name: "index_leav_rejecteds_on_employee_leav_request_id", using: :btree

  create_table "leave_c_offs", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.date     "c_off_date"
    t.string   "c_off_type",       limit: 255
    t.integer  "c_off_expire_day", limit: 4,                             default: 0
    t.boolean  "expiry_status"
    t.boolean  "is_taken",                                               default: false
    t.date     "expiry_date"
    t.decimal  "leave_count",                    precision: 3, scale: 1
    t.boolean  "is_expire"
    t.boolean  "status"
    t.string   "current_status",   limit: 255
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.text     "comment",          limit: 65535
  end

  add_index "leave_c_offs", ["employee_id"], name: "index_leave_c_offs_on_employee_id", using: :btree

  create_table "leave_cash_masters", force: :cascade do |t|
    t.string   "base_component", limit: 255
    t.string   "rate",           limit: 255
    t.boolean  "is_confirm"
    t.boolean  "is_active"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "leave_cashables", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.integer  "leav_category_id", limit: 4
    t.date     "date"
    t.string   "no_of_leave",      limit: 255
    t.string   "cashable",         limit: 255
    t.decimal  "amount",                       precision: 10
    t.boolean  "is_confirm"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "leave_cashables", ["employee_id"], name: "index_leave_cashables_on_employee_id", using: :btree
  add_index "leave_cashables", ["leav_category_id"], name: "index_leave_cashables_on_leav_category_id", using: :btree

  create_table "leave_details", force: :cascade do |t|
    t.integer  "salaryslip_id",    limit: 4
    t.integer  "leav_category_id", limit: 4
    t.string   "no_of_leave",      limit: 255
    t.decimal  "balance",                      precision: 10
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "leave_details", ["leav_category_id"], name: "index_leave_details_on_leav_category_id", using: :btree
  add_index "leave_details", ["salaryslip_id"], name: "index_leave_details_on_salaryslip_id", using: :btree

  create_table "leave_masters", force: :cascade do |t|
    t.integer  "leav_category_id",   limit: 4
    t.string   "period",             limit: 255
    t.decimal  "working_day",                    precision: 10
    t.string   "no_of_leave",        limit: 255
    t.boolean  "is_carry_forward"
    t.string   "limit",              limit: 255
    t.decimal  "company_workingday",             precision: 10
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "leave_masters", ["leav_category_id"], name: "index_leave_masters_on_leav_category_id", using: :btree

  create_table "leave_records", force: :cascade do |t|
    t.integer  "employee_leav_request_id", limit: 4
    t.integer  "employee_id",              limit: 4
    t.integer  "leav_category_id",         limit: 4
    t.boolean  "is_confirm"
    t.date     "day"
    t.string   "status",                   limit: 255
    t.decimal  "count",                                precision: 10
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "leave_records", ["employee_id"], name: "index_leave_records_on_employee_id", using: :btree
  add_index "leave_records", ["employee_leav_request_id"], name: "index_leave_records_on_employee_leav_request_id", using: :btree
  add_index "leave_records", ["leav_category_id"], name: "index_leave_records_on_leav_category_id", using: :btree

  create_table "leave_status_records", force: :cascade do |t|
    t.integer  "employee_leav_request_id",  limit: 4
    t.integer  "change_status_employee_id", limit: 4
    t.string   "status",                    limit: 255
    t.datetime "change_date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "leave_status_records", ["employee_leav_request_id"], name: "index_leave_status_records_on_employee_leav_request_id", using: :btree

  create_table "leave_transfers", force: :cascade do |t|
    t.integer  "employee_id",              limit: 4
    t.integer  "transfer_to_id",           limit: 4
    t.date     "date"
    t.string   "no_of_leave",              limit: 255
    t.string   "status",                   limit: 255
    t.integer  "employee_leav_balance_id", limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "leav_category_id",         limit: 4
    t.string   "reason",                   limit: 255
  end

  add_index "leave_transfers", ["employee_id"], name: "index_leave_transfers_on_employee_id", using: :btree
  add_index "leave_transfers", ["employee_leav_balance_id"], name: "index_leave_transfers_on_employee_leav_balance_id", using: :btree
  add_index "leave_transfers", ["leav_category_id"], name: "index_leave_transfers_on_leav_category_id", using: :btree

  create_table "leaving_reasons", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "loan_approvals", force: :cascade do |t|
    t.integer  "loan_request_id",    limit: 4
    t.integer  "membership_id",      limit: 4
    t.integer  "loan_type_id",       limit: 4
    t.integer  "approval_id",        limit: 4
    t.decimal  "amount",                         precision: 15, scale: 2
    t.integer  "no_of_emi",          limit: 4
    t.decimal  "emi",                            precision: 15, scale: 2
    t.date     "loan_request_date"
    t.date     "loan_approval_date"
    t.string   "status",             limit: 255
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "loan_approvals", ["loan_request_id"], name: "index_loan_approvals_on_loan_request_id", using: :btree
  add_index "loan_approvals", ["loan_type_id"], name: "index_loan_approvals_on_loan_type_id", using: :btree
  add_index "loan_approvals", ["membership_id"], name: "index_loan_approvals_on_membership_id", using: :btree

  create_table "loan_emis", force: :cascade do |t|
    t.integer  "loan_approval_id", limit: 4
    t.date     "date"
    t.decimal  "emi_amount",                 precision: 15, scale: 2
    t.boolean  "status",                                              default: false
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  add_index "loan_emis", ["loan_approval_id"], name: "index_loan_emis_on_loan_approval_id", using: :btree

  create_table "loan_requests", force: :cascade do |t|
    t.integer  "membership_id", limit: 4
    t.date     "date"
    t.integer  "loan_type_id",  limit: 4
    t.integer  "request_to_id", limit: 4
    t.decimal  "amount",                    precision: 15, scale: 2
    t.integer  "no_of_emi",     limit: 4
    t.decimal  "emi",                       precision: 15, scale: 2
    t.string   "status",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "loan_requests", ["loan_type_id"], name: "index_loan_requests_on_loan_type_id", using: :btree
  add_index "loan_requests", ["membership_id"], name: "index_loan_requests_on_membership_id", using: :btree

  create_table "loan_types", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.decimal  "from",                        precision: 10
    t.decimal  "to",                          precision: 10
    t.decimal  "interest_rate",               precision: 10
    t.string   "interest_type", limit: 255
    t.boolean  "status"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "machine_attendances", force: :cascade do |t|
    t.integer  "employee_id",     limit: 4
    t.date     "day"
    t.datetime "in"
    t.datetime "out"
    t.integer  "shift_master_id", limit: 4
    t.boolean  "is_proceed"
    t.string   "present",         limit: 255
    t.integer  "user_id",         limit: 4
    t.boolean  "is_updated"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "machine_attendances", ["employee_id"], name: "index_machine_attendances_on_employee_id", using: :btree
  add_index "machine_attendances", ["shift_master_id"], name: "index_machine_attendances_on_shift_master_id", using: :btree

  create_table "manager_2s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_histories", force: :cascade do |t|
    t.integer  "employee_id",    limit: 4
    t.integer  "manager_id",     limit: 4
    t.integer  "manager_2_id",   limit: 4
    t.date     "effective_from"
    t.date     "effective_to"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "manager_histories", ["employee_id"], name: "index_manager_histories_on_employee_id", using: :btree

  create_table "managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meet_tos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "manual_member_code",     limit: 255
    t.integer  "role_id",                limit: 4
    t.string   "member_code",            limit: 255
    t.string   "subdomain",              limit: 255
    t.string   "email",                  limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.boolean  "is_gps"
    t.boolean  "boolean"
    t.float    "latitude",               limit: 24
    t.float    "float",                  limit: 24
    t.float    "longitude",              limit: 24
    t.string   "location",               limit: 255
    t.string   "string",                 limit: 255
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
    t.integer  "company_id",             limit: 4
    t.integer  "company_location_id",    limit: 4
    t.integer  "department_id",          limit: 4
    t.integer  "employee_id",            limit: 4
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "members", ["company_id"], name: "index_members_on_company_id", using: :btree
  add_index "members", ["company_location_id"], name: "index_members_on_company_location_id", using: :btree
  add_index "members", ["department_id"], name: "index_members_on_department_id", using: :btree
  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["employee_id"], name: "index_members_on_employee_id", using: :btree
  add_index "members", ["member_code"], name: "index_members_on_member_code", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  add_index "members", ["role_id"], name: "index_members_on_role_id", using: :btree

  create_table "membership_balances", force: :cascade do |t|
    t.integer  "membership_id", limit: 4
    t.decimal  "balance",                 precision: 10
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "membership_balances", ["membership_id"], name: "index_membership_balances_on_membership_id", using: :btree

  create_table "membership_contributions", force: :cascade do |t|
    t.integer  "membership_id", limit: 4
    t.date     "date"
    t.decimal  "amount",                  precision: 10
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "membership_contributions", ["membership_id"], name: "index_membership_contributions_on_membership_id", using: :btree

  create_table "membership_types", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.boolean  "status"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.integer  "membership_type_id", limit: 4
    t.decimal  "contribution",                 precision: 10
    t.date     "date"
    t.boolean  "status"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "memberships", ["employee_id"], name: "index_memberships_on_employee_id", using: :btree
  add_index "memberships", ["membership_type_id"], name: "index_memberships_on_membership_type_id", using: :btree

  create_table "monthly_arrears", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.date     "day"
    t.decimal  "amount",                    precision: 10
    t.boolean  "is_paid"
    t.text     "description", limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "monthly_arrears", ["employee_id"], name: "index_monthly_arrears_on_employee_id", using: :btree

  create_table "monthly_expences", force: :cascade do |t|
    t.date     "expence_date"
    t.decimal  "amount",                          precision: 15, scale: 2, default: 0.0
    t.integer  "employee_id",       limit: 4
    t.integer  "expencess_type_id", limit: 4
    t.boolean  "is_paid"
    t.text     "description",       limit: 65535
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
  end

  add_index "monthly_expences", ["employee_id"], name: "index_monthly_expences_on_employee_id", using: :btree
  add_index "monthly_expences", ["expencess_type_id"], name: "index_monthly_expences_on_expencess_type_id", using: :btree

  create_table "nationalities", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "nomination_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "od_records", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.integer  "on_duty_request_id", limit: 4
    t.date     "day"
    t.string   "status",             limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "od_records", ["employee_id"], name: "index_od_records_on_employee_id", using: :btree
  add_index "od_records", ["on_duty_request_id"], name: "index_od_records_on_on_duty_request_id", using: :btree

  create_table "od_status_records", force: :cascade do |t|
    t.integer  "on_duty_request_id", limit: 4
    t.integer  "employee_id",        limit: 4
    t.string   "status",             limit: 255
    t.datetime "change_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "od_status_records", ["employee_id"], name: "index_od_status_records_on_employee_id", using: :btree
  add_index "od_status_records", ["on_duty_request_id"], name: "index_od_status_records_on_on_duty_request_id", using: :btree

  create_table "on_duty_requests", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.string   "leave_type",         limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "no_of_day",          limit: 255
    t.text     "reason",             limit: 65535
    t.boolean  "first_half"
    t.boolean  "last_half"
    t.boolean  "present_status"
    t.integer  "first_reporter_id",  limit: 4
    t.integer  "second_reporter_id", limit: 4
    t.integer  "current_status",     limit: 4
    t.boolean  "is_pending"
    t.boolean  "is_cancelled"
    t.boolean  "is_first_approved"
    t.boolean  "is_second_approved"
    t.boolean  "is_first_rejected"
    t.boolean  "is_second_rejected"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "on_duty_requests", ["employee_id"], name: "index_on_duty_requests_on_employee_id", using: :btree

  create_table "other_salary_components", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "is_deducted", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "overall_ratings", force: :cascade do |t|
    t.integer  "goal_rating_sheet_id", limit: 4
    t.integer  "employee_id",          limit: 4
    t.integer  "ro1_id",               limit: 4
    t.integer  "ro2_id",               limit: 4
    t.integer  "final_id",             limit: 4
    t.integer  "ro1_rating_id",        limit: 4
    t.text     "ro1_comment",          limit: 65535
    t.integer  "ro2_rating_id",        limit: 4
    t.text     "ro2_comment",          limit: 65535
    t.integer  "final_rating_id",      limit: 4
    t.text     "final_comment",        limit: 65535
    t.boolean  "promotion"
    t.decimal  "increement_amount",                  precision: 10
    t.decimal  "final_ctc",                          precision: 10
    t.text     "appraisee_comment",    limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "overall_ratings", ["employee_id"], name: "index_overall_ratings_on_employee_id", using: :btree
  add_index "overall_ratings", ["final_id"], name: "index_overall_ratings_on_final_id", using: :btree
  add_index "overall_ratings", ["final_rating_id"], name: "index_overall_ratings_on_final_rating_id", using: :btree
  add_index "overall_ratings", ["goal_rating_sheet_id"], name: "index_overall_ratings_on_goal_rating_sheet_id", using: :btree
  add_index "overall_ratings", ["ro1_id"], name: "index_overall_ratings_on_ro1_id", using: :btree
  add_index "overall_ratings", ["ro1_rating_id"], name: "index_overall_ratings_on_ro1_rating_id", using: :btree
  add_index "overall_ratings", ["ro2_id"], name: "index_overall_ratings_on_ro2_id", using: :btree
  add_index "overall_ratings", ["ro2_rating_id"], name: "index_overall_ratings_on_ro2_rating_id", using: :btree

  create_table "overtime_daily_records", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.date     "ot_daily_date"
    t.decimal  "ot_daily_hrs",                      precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_rate",                           precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_daily_amount",                   precision: 15, scale: 2, default: 0.0
    t.decimal  "attendance_bonus_amount",           precision: 15, scale: 2, default: 0.0
    t.decimal  "paid_holiday_amount",               precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "overtime_daily_records", ["employee_id"], name: "index_overtime_daily_records_on_employee_id", using: :btree

  create_table "overtime_masters", force: :cascade do |t|
    t.boolean  "is_over_time"
    t.integer  "day",          limit: 4
    t.decimal  "company_hrs",            precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_rate",                precision: 15, scale: 2, default: 0.0
    t.boolean  "is_esic"
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "overtime_month_records", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.date     "overtime_data"
    t.decimal  "attendance_bonus_amount",           precision: 15, scale: 2
    t.decimal  "paid_holiday_amount",               precision: 15, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "overtime_month_records", ["employee_id"], name: "index_overtime_month_records_on_employee_id", using: :btree

  create_table "overtime_salaries", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.date     "date"
    t.decimal  "ot_hrs",                            precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_esic_amount",                    precision: 15, scale: 2, default: 0.0
    t.decimal  "total_amount",                      precision: 15, scale: 2, default: 0.0
    t.decimal  "attendence_bouns_amount",           precision: 15, scale: 2, default: 0.0
    t.decimal  "paid_holiday_amount",               precision: 15, scale: 2, default: 0.0
    t.decimal  "net_payble_amount",                 precision: 15, scale: 2, default: 0.0
    t.date     "ot_date"
    t.decimal  "basic_amount",                      precision: 15, scale: 2, default: 0.0
    t.decimal  "ot_amount",                         precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "overtime_salaries", ["employee_id"], name: "index_overtime_salaries_on_employee_id", using: :btree

  create_table "overtimes", force: :cascade do |t|
    t.integer  "employee_id",       limit: 4
    t.date     "ot_date"
    t.string   "ot_type",           limit: 255
    t.string   "ot_total_hrs",      limit: 255
    t.string   "total_production",  limit: 255
    t.string   "normal_wages_rate", limit: 255
    t.string   "ot_wages_rate",     limit: 255
    t.string   "ot_earning",        limit: 255
    t.date     "paid_on_date"
    t.text     "remarks",           limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "overtimes", ["employee_id"], name: "index_overtimes_on_employee_id", using: :btree

  create_table "parent_salary_components", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "particular_leave_records", force: :cascade do |t|
    t.integer  "employee_id",              limit: 4
    t.integer  "employee_leav_request_id", limit: 4
    t.integer  "leav_category_id",         limit: 4
    t.datetime "leave_date"
    t.boolean  "is_full"
    t.boolean  "is_cancel_after_approve"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "particular_leave_records", ["employee_id"], name: "index_particular_leave_records_on_employee_id", using: :btree
  add_index "particular_leave_records", ["employee_leav_request_id"], name: "index_particular_leave_records_on_employee_leav_request_id", using: :btree
  add_index "particular_leave_records", ["leav_category_id"], name: "index_particular_leave_records_on_leav_category_id", using: :btree

  create_table "particular_od_records", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.integer  "on_duty_request_id",      limit: 4
    t.datetime "leave_date"
    t.boolean  "is_full"
    t.boolean  "is_cancel_after_approve"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "particular_od_records", ["employee_id"], name: "index_particular_od_records_on_employee_id", using: :btree
  add_index "particular_od_records", ["on_duty_request_id"], name: "index_particular_od_records_on_on_duty_request_id", using: :btree

  create_table "particular_vacancy_requests", force: :cascade do |t|
    t.integer  "vacancy_master_id",       limit: 4
    t.integer  "employee_id",             limit: 4
    t.integer  "employee_designation_id", limit: 4
    t.string   "candidate_name",          limit: 255
    t.string   "vacancy_name",            limit: 255
    t.date     "open_date"
    t.date     "closed_date"
    t.date     "fulfillment_date"
    t.string   "status",                  limit: 255
    t.boolean  "is_complete"
    t.integer  "closed_position",         limit: 4
    t.integer  "interview_schedule_id",   limit: 4
    t.integer  "selected_resume_id",      limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "particular_vacancy_requests", ["employee_designation_id"], name: "index_particular_vacancy_requests_on_employee_designation_id", using: :btree
  add_index "particular_vacancy_requests", ["employee_id"], name: "index_particular_vacancy_requests_on_employee_id", using: :btree
  add_index "particular_vacancy_requests", ["interview_schedule_id"], name: "index_particular_vacancy_requests_on_interview_schedule_id", using: :btree
  add_index "particular_vacancy_requests", ["selected_resume_id"], name: "index_particular_vacancy_requests_on_selected_resume_id", using: :btree
  add_index "particular_vacancy_requests", ["vacancy_master_id"], name: "index_particular_vacancy_requests_on_vacancy_master_id", using: :btree

  create_table "payment_modes", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "payroll_overtime_masters", force: :cascade do |t|
    t.boolean  "is_payroll"
    t.string   "base_component", limit: 255
    t.string   "rate",           limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.string   "company_hrs",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "payroll_periods", force: :cascade do |t|
    t.date     "from"
    t.date     "to"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performance_activities", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "performance_calendars", force: :cascade do |t|
    t.integer  "period_id",               limit: 4
    t.integer  "performance_activity_id", limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_confirm"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "performance_calendars", ["performance_activity_id"], name: "index_performance_calendars_on_performance_activity_id", using: :btree
  add_index "performance_calendars", ["period_id"], name: "index_performance_calendars_on_period_id", using: :btree

  create_table "performance_periods", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.string   "description", limit: 255
    t.boolean  "is_open"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "periods", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.date     "from"
    t.date     "to"
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pf_employers", force: :cascade do |t|
    t.string   "base_component", limit: 255
    t.decimal  "percentage",                 precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "pf_masters", force: :cascade do |t|
    t.boolean  "is_pf"
    t.decimal  "percentage",                 precision: 4,  scale: 2
    t.date     "date_effective"
    t.decimal  "min_limit",                  precision: 15, scale: 2
    t.string   "base_component", limit: 255
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "policy_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_active"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "pre_onboardings", force: :cascade do |t|
    t.integer  "selected_resume_id", limit: 4
    t.string   "first_name",         limit: 255
    t.string   "middle_name",        limit: 255
    t.string   "last_name",          limit: 255
    t.date     "birth_date"
    t.string   "gender",             limit: 255
    t.string   "marital_status",     limit: 255
    t.string   "fathers_name",       limit: 255
    t.string   "nationality",        limit: 255
    t.text     "permanent_address",  limit: 65535
    t.string   "city",               limit: 255
    t.integer  "country_id",         limit: 4
    t.integer  "state_id",           limit: 4
    t.integer  "district_id",        limit: 4
    t.string   "pin_code",           limit: 255
    t.text     "current_address",    limit: 65535
    t.string   "contact_no",         limit: 255
    t.string   "optional_no",        limit: 255
    t.string   "email",              limit: 255
    t.string   "pan_no",             limit: 255
    t.string   "adhar_no",           limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "pre_onboardings", ["country_id"], name: "index_pre_onboardings_on_country_id", using: :btree
  add_index "pre_onboardings", ["district_id"], name: "index_pre_onboardings_on_district_id", using: :btree
  add_index "pre_onboardings", ["selected_resume_id"], name: "index_pre_onboardings_on_selected_resume_id", using: :btree
  add_index "pre_onboardings", ["state_id"], name: "index_pre_onboardings_on_state_id", using: :btree

  create_table "professional_tax_masters", force: :cascade do |t|
    t.string   "base_component",      limit: 255
    t.decimal  "min_amount",                      precision: 10
    t.decimal  "max_amount",                      precision: 10
    t.decimal  "for_month",                       precision: 10
    t.decimal  "march_amount",                    precision: 10
    t.date     "effective_from"
    t.date     "effective_to"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.integer  "company_location_id", limit: 4
    t.boolean  "basis_actual_amount"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "professional_tax_masters", ["company_location_id"], name: "index_professional_tax_masters_on_company_location_id", using: :btree

  create_table "professional_taxes", force: :cascade do |t|
    t.string   "is_pt",       limit: 255
    t.decimal  "min_salary",              precision: 15, scale: 2, default: 0.0
    t.decimal  "max_salary",              precision: 15, scale: 2, default: 0.0
    t.decimal  "pt_amount",               precision: 15, scale: 2, default: 0.0
    t.decimal  "for_months",              precision: 15, scale: 2, default: 0.0
    t.decimal  "march_month",             precision: 15, scale: 2, default: 0.0
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "project_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "promotion_histories", force: :cascade do |t|
    t.integer  "employee_promotion_id",   limit: 4
    t.integer  "employee_id",             limit: 4
    t.integer  "department_id",           limit: 4
    t.integer  "employee_designation_id", limit: 4
    t.integer  "employee_grade_id",       limit: 4
    t.integer  "employee_category_id",    limit: 4
    t.string   "employee_ctc",            limit: 255
    t.text     "justification",           limit: 65535
    t.date     "effective_from"
    t.date     "effective_to"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "promotion_histories", ["department_id"], name: "index_promotion_histories_on_department_id", using: :btree
  add_index "promotion_histories", ["employee_category_id"], name: "index_promotion_histories_on_employee_category_id", using: :btree
  add_index "promotion_histories", ["employee_designation_id"], name: "index_promotion_histories_on_employee_designation_id", using: :btree
  add_index "promotion_histories", ["employee_grade_id"], name: "index_promotion_histories_on_employee_grade_id", using: :btree
  add_index "promotion_histories", ["employee_id"], name: "index_promotion_histories_on_employee_id", using: :btree
  add_index "promotion_histories", ["employee_promotion_id"], name: "index_promotion_histories_on_employee_promotion_id", using: :btree

  create_table "punch_cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "punch_masters", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.string   "reader_in",    limit: 255
    t.string   "reader_out",   limit: 255
    t.decimal  "full_day_hrs",             precision: 10
    t.decimal  "half_day_hrs",             precision: 10
    t.boolean  "status"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.integer  "degree_id",        limit: 4
    t.integer  "degree_type_id",   limit: 4
    t.integer  "degree_stream_id", limit: 4
    t.integer  "year_id",          limit: 4
    t.integer  "university_id",    limit: 4
    t.string   "college",          limit: 255
    t.string   "marks_type",       limit: 255
    t.string   "marks",            limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "qualifications", ["degree_id"], name: "index_qualifications_on_degree_id", using: :btree
  add_index "qualifications", ["degree_stream_id"], name: "index_qualifications_on_degree_stream_id", using: :btree
  add_index "qualifications", ["degree_type_id"], name: "index_qualifications_on_degree_type_id", using: :btree
  add_index "qualifications", ["employee_id"], name: "index_qualifications_on_employee_id", using: :btree
  add_index "qualifications", ["university_id"], name: "index_qualifications_on_university_id", using: :btree
  add_index "qualifications", ["year_id"], name: "index_qualifications_on_year_id", using: :btree

  create_table "question_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "r_designations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rating_masters", force: :cascade do |t|
    t.integer  "code",        limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "value",       limit: 255
    t.text     "discription", limit: 65535
    t.boolean  "is_confirm"
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "recognition_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "recruiters", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.boolean  "status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "recruiters", ["employee_id"], name: "index_recruiters_on_employee_id", using: :btree

  create_table "reimbursement_heads", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reimbursement_requests", force: :cascade do |t|
    t.integer  "employee_id",           limit: 4
    t.integer  "reimbursement_head_id", limit: 4
    t.date     "date"
    t.decimal  "amount",                            precision: 10, scale: 2, default: 0.0
    t.string   "status",                limit: 255
    t.integer  "approval_id",           limit: 4
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "reimbursement_requests", ["employee_id"], name: "index_reimbursement_requests_on_employee_id", using: :btree
  add_index "reimbursement_requests", ["reimbursement_head_id"], name: "index_reimbursement_requests_on_reimbursement_head_id", using: :btree

  create_table "reimbursement_slabs", force: :cascade do |t|
    t.integer  "reimbursement_head_id",   limit: 4
    t.integer  "employee_grade_id",       limit: 4
    t.integer  "employee_designation_id", limit: 4
    t.decimal  "from",                              precision: 10, scale: 2, default: 0.0
    t.decimal  "to",                                precision: 10, scale: 2, default: 0.0
    t.decimal  "monthly_amount",                    precision: 10, scale: 2, default: 0.0
    t.decimal  "yearly_amount",                     precision: 10, scale: 2, default: 0.0
    t.boolean  "status"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
  end

  add_index "reimbursement_slabs", ["employee_designation_id"], name: "index_reimbursement_slabs_on_employee_designation_id", using: :btree
  add_index "reimbursement_slabs", ["employee_grade_id"], name: "index_reimbursement_slabs_on_employee_grade_id", using: :btree
  add_index "reimbursement_slabs", ["reimbursement_head_id"], name: "index_reimbursement_slabs_on_reimbursement_head_id", using: :btree

  create_table "relation_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "religions", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "code",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "rembursmentmasters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status",                    default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "rembursments", force: :cascade do |t|
    t.integer  "employee_id",          limit: 4
    t.integer  "manager_id",           limit: 4
    t.date     "application_date"
    t.date     "rembursment_date"
    t.integer  "rembursmentmaster_id", limit: 4
    t.decimal  "amount",                           precision: 5, scale: 1
    t.date     "paid_date"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "status",               limit: 255
  end

  add_index "rembursments", ["employee_id"], name: "index_rembursments_on_employee_id", using: :btree
  add_index "rembursments", ["rembursmentmaster_id"], name: "index_rembursments_on_rembursmentmaster_id", using: :btree

  create_table "replacements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_employee_transfers", force: :cascade do |t|
    t.integer  "employee_transfer_id", limit: 4
    t.string   "status",               limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "reporting_master_id",  limit: 4
  end

  add_index "reporting_employee_transfers", ["employee_transfer_id"], name: "index_reporting_employee_transfers_on_employee_transfer_id", using: :btree

  create_table "reporting_master_rembursments", force: :cascade do |t|
    t.integer  "rembursment_id", limit: 4
    t.integer  "manager_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "status",         limit: 255
  end

  add_index "reporting_master_rembursments", ["rembursment_id"], name: "index_reporting_master_rembursments_on_rembursment_id", using: :btree

  create_table "reporting_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "employee_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "is_active"
  end

  add_index "reporting_masters", ["employee_id"], name: "index_reporting_masters_on_employee_id", using: :btree

  create_table "reporting_masters_resigns", force: :cascade do |t|
    t.integer  "employee_resignation_id", limit: 4
    t.integer  "reporting_master_id",     limit: 4
    t.string   "resignation_status",      limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "reporting_masters_resigns", ["employee_resignation_id"], name: "index_reporting_masters_resigns_on_employee_resignation_id", using: :btree
  add_index "reporting_masters_resigns", ["reporting_master_id"], name: "index_reporting_masters_resigns_on_reporting_master_id", using: :btree

  create_table "reporting_masters_training_reqs", force: :cascade do |t|
    t.integer  "training_request_id", limit: 4
    t.integer  "reporting_master_id", limit: 4
    t.string   "training_status",     limit: 255
    t.string   "employee_training",   limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "reporting_masters_training_reqs", ["reporting_master_id"], name: "index_reporting_masters_training_reqs_on_reporting_master_id", using: :btree
  add_index "reporting_masters_training_reqs", ["training_request_id"], name: "index_reporting_masters_training_reqs_on_training_request_id", using: :btree

  create_table "reporting_masters_travel_requests", force: :cascade do |t|
    t.integer  "travel_request_id",   limit: 4
    t.string   "travel_status",       limit: 255
    t.boolean  "status"
    t.text     "daily_bill_comment",  limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "reporting_master_id", limit: 4
  end

  add_index "reporting_masters_travel_requests", ["travel_request_id"], name: "index_reporting_masters_travel_requests_on_travel_request_id", using: :btree

  create_table "reporting_masters_vacancy_masters", force: :cascade do |t|
    t.integer  "vacancy_master_id",   limit: 4
    t.string   "vacancy_status",      limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "reporting_master_id", limit: 4
  end

  add_index "reporting_masters_vacancy_masters", ["vacancy_master_id"], name: "index_reporting_masters_vacancy_masters_on_vacancy_master_id", using: :btree

  create_table "reserved_categories", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "resignation_histories", force: :cascade do |t|
    t.integer  "employee_resignation_id", limit: 4
    t.integer  "reporting_master_id",     limit: 4
    t.date     "resignation_date"
    t.string   "reason",                  limit: 255
    t.boolean  "is_notice_period"
    t.string   "notice_period",           limit: 255
    t.string   "short_notice_period",     limit: 255
    t.date     "tentative_leaving_date"
    t.text     "remark",                  limit: 65535
    t.date     "exit_interview_date"
    t.text     "note",                    limit: 65535
    t.date     "leaving_date"
    t.date     "settled_on"
    t.boolean  "has_left"
    t.boolean  "notice_served"
    t.boolean  "rehired"
    t.integer  "leaving_reason_id",       limit: 4
    t.integer  "employee_id",             limit: 4
    t.string   "resign_status",           limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "resignation_histories", ["employee_id"], name: "index_resignation_histories_on_employee_id", using: :btree
  add_index "resignation_histories", ["employee_resignation_id"], name: "index_resignation_histories_on_employee_resignation_id", using: :btree
  add_index "resignation_histories", ["leaving_reason_id"], name: "index_resignation_histories_on_leaving_reason_id", using: :btree
  add_index "resignation_histories", ["reporting_master_id"], name: "index_resignation_histories_on_reporting_master_id", using: :btree

  create_table "resignation_status_records", force: :cascade do |t|
    t.integer  "employee_resignation_id",   limit: 4
    t.integer  "change_status_employee_id", limit: 4
    t.string   "status",                    limit: 255
    t.datetime "change_date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "resignation_status_records", ["employee_resignation_id"], name: "index_resignation_status_records_on_employee_resignation_id", using: :btree

  create_table "resource_pool_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "retention_moneys", force: :cascade do |t|
    t.boolean  "have_retention"
    t.decimal  "amount",                     precision: 15, scale: 2
    t.decimal  "decimal",                    precision: 15, scale: 2
    t.string   "no_of_month",    limit: 255
    t.string   "description",    limit: 255
    t.boolean  "is_confirm"
    t.decimal  "persent",                    precision: 10
    t.string   "max_limit",      limit: 255
    t.string   "base_component", limit: 255
    t.boolean  "is_active"
    t.string   "is_persent",     limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "reviewer_ratings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviewers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reward_allocations", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reward_owners", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reward_recognitions", force: :cascade do |t|
    t.integer  "reward_type_id",  limit: 4
    t.integer  "reward_owner_id", limit: 4
    t.string   "cost_unit",       limit: 255
    t.string   "communication",   limit: 255
    t.string   "r_type",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "reward_recognitions", ["reward_owner_id"], name: "index_reward_recognitions_on_reward_owner_id", using: :btree
  add_index "reward_recognitions", ["reward_type_id"], name: "index_reward_recognitions_on_reward_type_id", using: :btree

  create_table "reward_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "rewards_allocations", force: :cascade do |t|
    t.integer  "reward_type_id",      limit: 4
    t.integer  "department_id",       limit: 4
    t.integer  "reporting_master_id", limit: 4
    t.date     "from"
    t.date     "to"
    t.string   "allocated_qty",       limit: 255
    t.decimal  "cost",                            precision: 10
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "rewards_allocations", ["department_id"], name: "index_rewards_allocations_on_department_id", using: :btree
  add_index "rewards_allocations", ["reporting_master_id"], name: "index_rewards_allocations_on_reporting_master_id", using: :btree
  add_index "rewards_allocations", ["reward_type_id"], name: "index_rewards_allocations_on_reward_type_id", using: :btree

  create_table "rewards_pals", force: :cascade do |t|
    t.integer  "employee_id",         limit: 4
    t.date     "date"
    t.text     "purpose",             limit: 65535
    t.integer  "reward_type_id",      limit: 4
    t.string   "qty",                 limit: 255
    t.integer  "reporting_master_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "rewards_pals", ["employee_id"], name: "index_rewards_pals_on_employee_id", using: :btree
  add_index "rewards_pals", ["reporting_master_id"], name: "index_rewards_pals_on_reporting_master_id", using: :btree
  add_index "rewards_pals", ["reward_type_id"], name: "index_rewards_pals_on_reward_type_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "root_cause_masters", force: :cascade do |t|
    t.integer  "code",        limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "salary_comp_mappings", force: :cascade do |t|
    t.integer  "salary_component_id", limit: 4
    t.integer  "erp_account_code",    limit: 4
    t.string   "map_type",            limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "salary_comp_mappings", ["salary_component_id"], name: "index_salary_comp_mappings_on_salary_component_id", using: :btree

  create_table "salary_component_templates", force: :cascade do |t|
    t.string   "manual_template_code",       limit: 255
    t.integer  "salary_template_id",         limit: 4
    t.integer  "salary_component_id",        limit: 4
    t.boolean  "is_deducted"
    t.integer  "parent_salary_component_id", limit: 4
    t.decimal  "percentage",                             precision: 4,  scale: 2
    t.boolean  "is_taxable"
    t.decimal  "tax",                                    precision: 4,  scale: 2
    t.string   "base",                       limit: 255
    t.string   "to_be_paid",                 limit: 255
    t.decimal  "max_amount",                             precision: 15, scale: 2
    t.decimal  "monthly_amount",                         precision: 15, scale: 2
    t.decimal  "annual_amount",                          precision: 15, scale: 2
    t.integer  "parent_id",                  limit: 4
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "salary_component_templates", ["salary_component_id"], name: "index_salary_component_templates_on_salary_component_id", using: :btree
  add_index "salary_component_templates", ["salary_template_id"], name: "index_salary_component_templates_on_salary_template_id", using: :btree

  create_table "salary_components", force: :cascade do |t|
    t.string   "code",         limit: 255
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.integer  "parent_id",    limit: 4
    t.boolean  "is_deducted"
    t.boolean  "is_confirm"
    t.string   "account_code", limit: 255
    t.boolean  "is_active"
    t.boolean  "is_base"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "salary_map_saps", force: :cascade do |t|
    t.integer  "salary_component_id", limit: 4
    t.integer  "company_id",          limit: 4
    t.integer  "company_location_id", limit: 4
    t.string   "account_code",        limit: 255
    t.boolean  "is_debit"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "salary_map_saps", ["company_id"], name: "index_salary_map_saps_on_company_id", using: :btree
  add_index "salary_map_saps", ["company_location_id"], name: "index_salary_map_saps_on_company_location_id", using: :btree
  add_index "salary_map_saps", ["salary_component_id"], name: "index_salary_map_saps_on_salary_component_id", using: :btree

  create_table "salary_templates", force: :cascade do |t|
    t.string   "code",          limit: 255
    t.string   "description",   limit: 255
    t.date     "validity_date"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "salaryslip_components", force: :cascade do |t|
    t.integer  "salaryslip_id",        limit: 4
    t.integer  "salary_component_id",  limit: 4
    t.decimal  "actual_amount",                    precision: 15, scale: 2
    t.decimal  "calculated_amount",                precision: 15, scale: 2
    t.boolean  "is_deducted"
    t.integer  "employee_template_id", limit: 4
    t.boolean  "is_arrear"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "other_component_name", limit: 255
  end

  add_index "salaryslip_components", ["employee_template_id"], name: "index_salaryslip_components_on_employee_template_id", using: :btree
  add_index "salaryslip_components", ["salary_component_id"], name: "index_salaryslip_components_on_salary_component_id", using: :btree
  add_index "salaryslip_components", ["salaryslip_id"], name: "index_salaryslip_components_on_salaryslip_id", using: :btree

  create_table "salaryslips", force: :cascade do |t|
    t.string   "salary_slip_code",           limit: 255
    t.integer  "employee_id",                limit: 4
    t.date     "month_year"
    t.string   "month",                      limit: 255
    t.string   "year",                       limit: 255
    t.integer  "workingday_id",              limit: 4
    t.decimal  "actual_gross_salary",                    precision: 15, scale: 2
    t.decimal  "calculated_gross_salary",                precision: 15, scale: 2
    t.decimal  "actual_total_deduction",                 precision: 15, scale: 2
    t.decimal  "calculated_total_deduction",             precision: 15, scale: 2
    t.decimal  "actual_net_salary",                      precision: 15, scale: 2
    t.decimal  "calculated_net_salary",                  precision: 15, scale: 2
    t.integer  "salary_template_id",         limit: 4
    t.string   "other_component_name",       limit: 255
    t.integer  "employee_template_id",       limit: 4
    t.decimal  "arrear_actual_amount",                   precision: 15, scale: 2
    t.decimal  "arrear_calculated_amount",               precision: 15, scale: 2
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "salaryslips", ["employee_id"], name: "index_salaryslips_on_employee_id", using: :btree
  add_index "salaryslips", ["employee_template_id"], name: "index_salaryslips_on_employee_template_id", using: :btree
  add_index "salaryslips", ["salary_template_id"], name: "index_salaryslips_on_salary_template_id", using: :btree
  add_index "salaryslips", ["workingday_id"], name: "index_salaryslips_on_workingday_id", using: :btree

  create_table "second_reporters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.decimal  "limit",                     precision: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "selected_resumes", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.string   "contact_no",                  limit: 255
    t.text     "skillset",                    limit: 65535
    t.integer  "degree_id",                   limit: 4
    t.decimal  "ctc",                                       precision: 10
    t.string   "email_id",                    limit: 255
    t.string   "experience",                  limit: 255
    t.string   "notice_period",               limit: 255
    t.integer  "vacancy_master_id",           limit: 4
    t.string   "offer_letter_status",         limit: 255
    t.string   "status",                      limit: 255
    t.string   "job_title",                   limit: 255
    t.boolean  "shortlist_for_interview"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "avatar_file_name",            limit: 255
    t.string   "avatar_content_type",         limit: 255
    t.integer  "avatar_file_size",            limit: 4
    t.datetime "avatar_updated_at"
    t.string   "passport_photo_file_name",    limit: 255
    t.string   "passport_photo_content_type", limit: 255
    t.integer  "passport_photo_file_size",    limit: 4
    t.datetime "passport_photo_updated_at"
    t.integer  "add_by_id",                   limit: 4
    t.decimal  "current_ctc",                               precision: 10
    t.string   "contact_no2",                 limit: 255
  end

  add_index "selected_resumes", ["degree_id"], name: "index_selected_resumes_on_degree_id", using: :btree
  add_index "selected_resumes", ["vacancy_master_id"], name: "index_selected_resumes_on_vacancy_master_id", using: :btree

  create_table "service_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "shift_masters", force: :cascade do |t|
    t.integer  "code",        limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_confirm"
    t.boolean  "is_active"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "shift_rotations", force: :cascade do |t|
    t.integer  "company_shift_id", limit: 4
    t.integer  "department_id",    limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "shift_rotations", ["company_shift_id"], name: "index_shift_rotations_on_company_shift_id", using: :btree
  add_index "shift_rotations", ["department_id"], name: "index_shift_rotations_on_department_id", using: :btree

  create_table "skillsets", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "name",        limit: 255
    t.string   "skill_level", limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "skillsets", ["employee_id"], name: "index_skillsets_on_employee_id", using: :btree

  create_table "slabs", force: :cascade do |t|
    t.decimal  "from",           precision: 10
    t.decimal  "to",             precision: 10
    t.decimal  "texable_amount", precision: 10
    t.decimal  "percentage",     precision: 10
    t.boolean  "status"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "slip_informations", force: :cascade do |t|
    t.integer  "salaryslip_id",           limit: 4
    t.integer  "cost_center_id",          limit: 4
    t.integer  "department_id",           limit: 4
    t.integer  "employee_designation_id", limit: 4
    t.string   "contact_no",              limit: 255
    t.string   "esic_no",                 limit: 255
    t.string   "pf_no",                   limit: 255
    t.string   "uan_no",                  limit: 255
    t.decimal  "cl",                                  precision: 10
    t.decimal  "el",                                  precision: 10
    t.decimal  "c_off",                               precision: 10
    t.decimal  "advance",                             precision: 10
    t.string   "account_no",              limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "slip_informations", ["cost_center_id"], name: "index_slip_informations_on_cost_center_id", using: :btree
  add_index "slip_informations", ["department_id"], name: "index_slip_informations_on_department_id", using: :btree
  add_index "slip_informations", ["employee_designation_id"], name: "index_slip_informations_on_employee_designation_id", using: :btree
  add_index "slip_informations", ["salaryslip_id"], name: "index_slip_informations_on_salaryslip_id", using: :btree

  create_table "society_member_ships", force: :cascade do |t|
    t.boolean  "is_society_member"
    t.decimal  "amount",                      precision: 15, scale: 2, default: 0.0
    t.integer  "employee_id",       limit: 4
    t.date     "start_date"
    t.boolean  "is_active"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  add_index "society_member_ships", ["employee_id"], name: "index_society_member_ships_on_employee_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.integer  "country_id", limit: 4
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "status_c_offs", force: :cascade do |t|
    t.integer  "leave_c_off_id", limit: 4
    t.integer  "employee_id",    limit: 4
    t.string   "status",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "status_c_offs", ["employee_id"], name: "index_status_c_offs_on_employee_id", using: :btree
  add_index "status_c_offs", ["leave_c_off_id"], name: "index_status_c_offs_on_leave_c_off_id", using: :btree

  create_table "sub_departments", force: :cascade do |t|
    t.integer  "department_id", limit: 4
    t.string   "code",          limit: 255
    t.string   "name",          limit: 255
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sub_departments", ["department_id"], name: "index_sub_departments_on_department_id", using: :btree

  create_table "target_companies", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "texable_amounts", force: :cascade do |t|
    t.integer  "employee_id",      limit: 4
    t.decimal  "yearly",                     precision: 10
    t.decimal  "monthly",                    precision: 10
    t.decimal  "remaining_amount",           precision: 10
    t.boolean  "is_paid"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "texable_amounts", ["employee_id"], name: "index_texable_amounts_on_employee_id", using: :btree

  create_table "texable_monthly_deductions", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.integer  "salaryslip_id",           limit: 4
    t.decimal  "texable_deducted_amount",           precision: 10
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "texable_monthly_deductions", ["employee_id"], name: "index_texable_monthly_deductions_on_employee_id", using: :btree
  add_index "texable_monthly_deductions", ["salaryslip_id"], name: "index_texable_monthly_deductions_on_salaryslip_id", using: :btree

  create_table "thoughts", force: :cascade do |t|
    t.date     "date"
    t.text     "thought",    limit: 65535
    t.string   "thought_of", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "trainee_requests", force: :cascade do |t|
    t.integer  "training_request_id",      limit: 4
    t.integer  "employee_id",              limit: 4
    t.integer  "reporting_master_id",      limit: 4
    t.integer  "training_topic_master_id", limit: 4
    t.boolean  "is_complete"
    t.boolean  "training_plan"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "trainee_requests", ["employee_id"], name: "index_trainee_requests_on_employee_id", using: :btree
  add_index "trainee_requests", ["reporting_master_id"], name: "index_trainee_requests_on_reporting_master_id", using: :btree
  add_index "trainee_requests", ["training_request_id"], name: "index_trainee_requests_on_training_request_id", using: :btree
  add_index "trainee_requests", ["training_topic_master_id"], name: "index_trainee_requests_on_training_topic_master_id", using: :btree

  create_table "trainees", force: :cascade do |t|
    t.integer  "training_plan_id", limit: 4
    t.integer  "employee_id",      limit: 4
    t.text     "feedback",         limit: 65535
    t.boolean  "is_complete"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "trainees", ["employee_id"], name: "index_trainees_on_employee_id", using: :btree
  add_index "trainees", ["training_plan_id"], name: "index_trainees_on_training_plan_id", using: :btree

  create_table "training_approvals", force: :cascade do |t|
    t.integer  "training_request_id",      limit: 4
    t.integer  "employee_id",              limit: 4
    t.integer  "training_topic_master_id", limit: 4
    t.integer  "reporting_master_id",      limit: 4
    t.string   "traininig_period",         limit: 255
    t.date     "training_date"
    t.string   "place",                    limit: 255
    t.string   "no_of_employee",           limit: 255
    t.text     "description",              limit: 65535
    t.text     "justification",            limit: 65535
    t.string   "current_status",           limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "training_approvals", ["employee_id"], name: "index_training_approvals_on_employee_id", using: :btree
  add_index "training_approvals", ["reporting_master_id"], name: "index_training_approvals_on_reporting_master_id", using: :btree
  add_index "training_approvals", ["training_request_id"], name: "index_training_approvals_on_training_request_id", using: :btree
  add_index "training_approvals", ["training_topic_master_id"], name: "index_training_approvals_on_training_topic_master_id", using: :btree

  create_table "training_plans", force: :cascade do |t|
    t.date     "training_date"
    t.string   "no_of_employee",           limit: 255
    t.string   "trainer_name",             limit: 255
    t.string   "no_of_days",               limit: 255
    t.string   "no_of_hrs",                limit: 255
    t.string   "place",                    limit: 255
    t.integer  "training_topic_master_id", limit: 4
    t.string   "trainer_num",              limit: 255
    t.text     "about_trainer",            limit: 65535
    t.integer  "period_id",                limit: 4
    t.string   "trainer_email",            limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "training_request_id",      limit: 4
  end

  add_index "training_plans", ["period_id"], name: "index_training_plans_on_period_id", using: :btree
  add_index "training_plans", ["training_topic_master_id"], name: "index_training_plans_on_training_topic_master_id", using: :btree

  create_table "training_records", force: :cascade do |t|
    t.integer  "employee_id",              limit: 4
    t.integer  "training_topic_master_id", limit: 4
    t.date     "training_date"
    t.string   "duration",                 limit: 255
    t.string   "location",                 limit: 255
    t.string   "trainer_name",             limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "training_records", ["employee_id"], name: "index_training_records_on_employee_id", using: :btree
  add_index "training_records", ["training_topic_master_id"], name: "index_training_records_on_training_topic_master_id", using: :btree

  create_table "training_requests", force: :cascade do |t|
    t.integer  "employee_id",              limit: 4
    t.string   "training_period",          limit: 255
    t.date     "training_date"
    t.integer  "reporting_master_id",      limit: 4
    t.integer  "training_topic_master_id", limit: 4
    t.text     "description",              limit: 65535
    t.integer  "no_of_employee",           limit: 4
    t.string   "place",                    limit: 255
    t.text     "justification",            limit: 65535
    t.string   "status",                   limit: 255
    t.text     "comment",                  limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "training_requests", ["employee_id"], name: "index_training_requests_on_employee_id", using: :btree
  add_index "training_requests", ["reporting_master_id"], name: "index_training_requests_on_reporting_master_id", using: :btree
  add_index "training_requests", ["training_topic_master_id"], name: "index_training_requests_on_training_topic_master_id", using: :btree

  create_table "training_topic_masters", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "training_topics", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "transfer_histories", force: :cascade do |t|
    t.integer  "employee_transfer_id",      limit: 4
    t.integer  "employee_id",               limit: 4
    t.integer  "employee_designation_id",   limit: 4
    t.integer  "employee_category_id",      limit: 4
    t.integer  "company_id",                limit: 4
    t.integer  "company_location_id",       limit: 4
    t.integer  "department_id",             limit: 4
    t.string   "designation",               limit: 255
    t.string   "category",                  limit: 255
    t.string   "employee_company",          limit: 255
    t.string   "employee_company_location", limit: 255
    t.string   "employee_department",       limit: 255
    t.string   "current_status",            limit: 255
    t.text     "justification",             limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.date     "effective_from"
    t.date     "effective_to"
    t.integer  "reporting_master_id",       limit: 4
  end

  add_index "transfer_histories", ["company_id"], name: "index_transfer_histories_on_company_id", using: :btree
  add_index "transfer_histories", ["company_location_id"], name: "index_transfer_histories_on_company_location_id", using: :btree
  add_index "transfer_histories", ["department_id"], name: "index_transfer_histories_on_department_id", using: :btree
  add_index "transfer_histories", ["employee_category_id"], name: "index_transfer_histories_on_employee_category_id", using: :btree
  add_index "transfer_histories", ["employee_designation_id"], name: "index_transfer_histories_on_employee_designation_id", using: :btree
  add_index "transfer_histories", ["employee_id"], name: "index_transfer_histories_on_employee_id", using: :btree
  add_index "transfer_histories", ["employee_transfer_id"], name: "index_transfer_histories_on_employee_transfer_id", using: :btree

  create_table "travel_expence_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "travel_expences", force: :cascade do |t|
    t.integer  "travel_request_id",    limit: 4
    t.decimal  "total_advance_amount",           precision: 15, scale: 2, default: 0.0
    t.decimal  "total_expence_amount",           precision: 15, scale: 2, default: 0.0
    t.decimal  "remaining_amount",               precision: 15, scale: 2, default: 0.0
    t.decimal  "employee_amount",                precision: 15, scale: 2, default: 0.0
    t.decimal  "company_amount",                 precision: 15, scale: 2, default: 0.0
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  add_index "travel_expences", ["travel_request_id"], name: "index_travel_expences_on_travel_request_id", using: :btree

  create_table "travel_modes", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "travel_options", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.text     "discription", limit: 65535
    t.boolean  "is_confirm"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "travel_request_histories", force: :cascade do |t|
    t.integer  "travel_request_id",   limit: 4
    t.date     "application_date"
    t.date     "traveling_date"
    t.string   "tour_purpose",        limit: 255
    t.string   "place",               limit: 255
    t.decimal  "total_advance",                   precision: 10
    t.string   "current_status",      limit: 255
    t.integer  "travel_option_id",    limit: 4
    t.integer  "travel_mode_id",      limit: 4
    t.integer  "employee_id",         limit: 4
    t.string   "status",              limit: 255
    t.string   "daily_bill_status",   limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "reporting_master_id", limit: 4
  end

  add_index "travel_request_histories", ["employee_id"], name: "index_travel_request_histories_on_employee_id", using: :btree
  add_index "travel_request_histories", ["travel_mode_id"], name: "index_travel_request_histories_on_travel_mode_id", using: :btree
  add_index "travel_request_histories", ["travel_option_id"], name: "index_travel_request_histories_on_travel_option_id", using: :btree
  add_index "travel_request_histories", ["travel_request_id"], name: "index_travel_request_histories_on_travel_request_id", using: :btree

  create_table "travel_requests", force: :cascade do |t|
    t.integer  "employee_id",         limit: 4
    t.date     "application_date"
    t.date     "traveling_date"
    t.text     "tour_purpose",        limit: 65535
    t.string   "place",               limit: 255
    t.decimal  "traveling_advance",                 precision: 15, scale: 2, default: 0.0
    t.string   "current_status",      limit: 255
    t.integer  "travel_option_id",    limit: 4
    t.integer  "travel_mode_id",      limit: 4
    t.text     "daily_bill_status",   limit: 65535
    t.date     "to"
    t.string   "day",                 limit: 255
    t.decimal  "expense",                           precision: 10
    t.boolean  "is_confirm"
    t.text     "comment",             limit: 65535
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.decimal  "total_advance",                     precision: 10
    t.integer  "reporting_master_id", limit: 4
  end

  add_index "travel_requests", ["employee_id"], name: "index_travel_requests_on_employee_id", using: :btree
  add_index "travel_requests", ["travel_mode_id"], name: "index_travel_requests_on_travel_mode_id", using: :btree
  add_index "travel_requests", ["travel_option_id"], name: "index_travel_requests_on_travel_option_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancy_masters", force: :cascade do |t|
    t.string   "vacancy_name",              limit: 255
    t.integer  "no_of_position",            limit: 4
    t.text     "description",               limit: 65535
    t.text     "justification",             limit: 65535
    t.date     "vacancy_post_date"
    t.string   "budget",                    limit: 255
    t.integer  "department_id",             limit: 4
    t.integer  "company_location_id",       limit: 4
    t.integer  "employee_designation_id",   limit: 4
    t.integer  "degree_id",                 limit: 4
    t.integer  "degree_1_id",               limit: 4
    t.integer  "degree_2_id",               limit: 4
    t.integer  "employee_id",               limit: 4
    t.string   "other_organization",        limit: 255
    t.string   "industry",                  limit: 255
    t.string   "current_status",            limit: 255
    t.date     "vacancy_fullfillment_date"
    t.boolean  "is_confirmed"
    t.string   "vacancy_code",              limit: 255
    t.string   "experience",                limit: 255
    t.string   "keyword",                   limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "recruiter_id",              limit: 4
    t.date     "target_date"
    t.integer  "company_id",                limit: 4
    t.string   "vacancy_of",                limit: 255
    t.string   "vacancy_type",              limit: 255
    t.string   "string",                    limit: 255
    t.string   "experince_max",             limit: 255
    t.string   "budget_max",                limit: 255
    t.string   "reason",                    limit: 255
    t.integer  "replacement_id",            limit: 4
    t.boolean  "notice_period"
    t.string   "notice_period_day",         limit: 255
    t.boolean  "relocation_rerimbursement"
    t.string   "relocation_cost",           limit: 255
    t.integer  "reporting_master_id",       limit: 4
    t.integer  "sub_department_id",         limit: 4
    t.integer  "cost_center_id",            limit: 4
    t.integer  "target_company_id",         limit: 4
    t.string   "secondary_skill",           limit: 255
    t.string   "billable",                  limit: 255
  end

  add_index "vacancy_masters", ["company_id"], name: "index_vacancy_masters_on_company_id", using: :btree
  add_index "vacancy_masters", ["company_location_id"], name: "index_vacancy_masters_on_company_location_id", using: :btree
  add_index "vacancy_masters", ["cost_center_id"], name: "index_vacancy_masters_on_cost_center_id", using: :btree
  add_index "vacancy_masters", ["degree_id"], name: "index_vacancy_masters_on_degree_id", using: :btree
  add_index "vacancy_masters", ["department_id"], name: "index_vacancy_masters_on_department_id", using: :btree
  add_index "vacancy_masters", ["employee_designation_id"], name: "index_vacancy_masters_on_employee_designation_id", using: :btree
  add_index "vacancy_masters", ["employee_id"], name: "index_vacancy_masters_on_employee_id", using: :btree
  add_index "vacancy_masters", ["recruiter_id"], name: "index_vacancy_masters_on_recruiter_id", using: :btree
  add_index "vacancy_masters", ["sub_department_id"], name: "index_vacancy_masters_on_sub_department_id", using: :btree
  add_index "vacancy_masters", ["target_company_id"], name: "index_vacancy_masters_on_target_company_id", using: :btree

  create_table "vacancy_request_histories", force: :cascade do |t|
    t.integer  "vacancy_master_id",       limit: 4
    t.string   "vacancy_name",            limit: 255
    t.integer  "no_of_position",          limit: 4
    t.text     "description",             limit: 65535
    t.date     "vacancy_post_date"
    t.string   "budget",                  limit: 255
    t.integer  "department_id",           limit: 4
    t.integer  "employee_designation_id", limit: 4
    t.integer  "company_location_id",     limit: 4
    t.integer  "degree_id",               limit: 4
    t.integer  "degree_1_id",             limit: 4
    t.integer  "degree_2_id",             limit: 4
    t.string   "experience",              limit: 255
    t.string   "keyword",                 limit: 255
    t.string   "other_organization",      limit: 255
    t.string   "industry",                limit: 255
    t.integer  "reporting_master_id",     limit: 4
    t.string   "current_status",          limit: 255
    t.integer  "employee_id",             limit: 4
    t.text     "justification",           limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "vacancy_request_histories", ["company_location_id"], name: "index_vacancy_request_histories_on_company_location_id", using: :btree
  add_index "vacancy_request_histories", ["degree_id"], name: "index_vacancy_request_histories_on_degree_id", using: :btree
  add_index "vacancy_request_histories", ["department_id"], name: "index_vacancy_request_histories_on_department_id", using: :btree
  add_index "vacancy_request_histories", ["employee_designation_id"], name: "index_vacancy_request_histories_on_employee_designation_id", using: :btree
  add_index "vacancy_request_histories", ["employee_id"], name: "index_vacancy_request_histories_on_employee_id", using: :btree
  add_index "vacancy_request_histories", ["reporting_master_id"], name: "index_vacancy_request_histories_on_reporting_master_id", using: :btree
  add_index "vacancy_request_histories", ["vacancy_master_id"], name: "index_vacancy_request_histories_on_vacancy_master_id", using: :btree

  create_table "vacancy_request_statuses", force: :cascade do |t|
    t.integer  "vacancy_request_id", limit: 4
    t.integer  "action_by_id",       limit: 4
    t.string   "status",             limit: 255
    t.date     "action_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "vacancy_request_statuses", ["vacancy_request_id"], name: "index_vacancy_request_statuses_on_vacancy_request_id", using: :btree

  create_table "vacancy_requests", force: :cascade do |t|
    t.string   "vacancy",                 limit: 255
    t.integer  "no_of_position",          limit: 4
    t.text     "description",             limit: 65535
    t.integer  "request_by_id",           limit: 4
    t.integer  "approval_by_id",          limit: 4
    t.date     "request_date"
    t.string   "qualification",           limit: 255
    t.text     "skill_set",               limit: 65535
    t.integer  "employee_designation_id", limit: 4
    t.integer  "department_id",           limit: 4
    t.string   "experience",              limit: 255
    t.string   "current_status",          limit: 255
    t.string   "vacancy_type",            limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "recruiter_id",            limit: 4
  end

  add_index "vacancy_requests", ["department_id"], name: "index_vacancy_requests_on_department_id", using: :btree
  add_index "vacancy_requests", ["employee_designation_id"], name: "index_vacancy_requests_on_employee_designation_id", using: :btree

  create_table "visitor_details", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "age",                 limit: 255
    t.string   "contact_no",          limit: 255
    t.string   "email_id",            limit: 255
    t.string   "id_proof",            limit: 255
    t.string   "from",                limit: 255
    t.integer  "employee_id",         limit: 4
    t.time     "in_time"
    t.time     "out_time"
    t.text     "purpose",             limit: 65535
    t.date     "visiting_date"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "visitor_details", ["employee_id"], name: "index_visitor_details_on_employee_id", using: :btree

  create_table "week_off_masters", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "day",         limit: 255
    t.boolean  "is_active"
    t.boolean  "is_send"
    t.date     "from"
    t.date     "to"
    t.boolean  "is_prefix"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "week_off_masters", ["employee_id"], name: "index_week_off_masters_on_employee_id", using: :btree

  create_table "week_offs", force: :cascade do |t|
    t.string   "weekoff_date_range", limit: 255
    t.integer  "employee_id",        limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "week_offs", ["employee_id"], name: "index_week_offs_on_employee_id", using: :btree

  create_table "weekoff_masters", force: :cascade do |t|
    t.string   "day",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "well_faires", force: :cascade do |t|
    t.string   "month",      limit: 255
    t.decimal  "amount",                 precision: 15, scale: 2, default: 0.0
    t.boolean  "status"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "workingdays", force: :cascade do |t|
    t.integer  "employee_id",             limit: 4
    t.date     "date"
    t.string   "month_name",              limit: 255
    t.string   "year",                    limit: 255
    t.date     "from"
    t.date     "to"
    t.integer  "day_in_month",            limit: 4
    t.decimal  "present_day",                         precision: 5,  scale: 1
    t.decimal  "holiday_in_month",                    precision: 5,  scale: 1
    t.decimal  "week_off_day",                        precision: 5,  scale: 1
    t.decimal  "absent_day",                          precision: 5,  scale: 1
    t.decimal  "payable_day",                         precision: 5,  scale: 1
    t.decimal  "calculated_payable_days",             precision: 5,  scale: 1
    t.decimal  "pay_leave",                           precision: 5,  scale: 1
    t.decimal  "nonpay_leave",                        precision: 5,  scale: 1
    t.decimal  "od_day",                              precision: 5,  scale: 1
    t.decimal  "ot_hours",                            precision: 5,  scale: 1
    t.decimal  "total_leave",                         precision: 5,  scale: 1
    t.boolean  "paid"
    t.boolean  "full_and_final"
    t.boolean  "is_confirm"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.decimal  "gatepass",                            precision: 10
    t.decimal  "nonpayble_day",                       precision: 10
    t.decimal  "nonpayable_day",                      precision: 10
  end

  add_index "workingdays", ["employee_id"], name: "index_workingdays_on_employee_id", using: :btree

  create_table "years", force: :cascade do |t|
    t.integer  "name",       limit: 4
    t.boolean  "is_confirm"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_foreign_key "access_issue_requests", "issue_requests"
  add_foreign_key "access_issue_requests", "issue_tracker_accesses"
  add_foreign_key "access_issue_requests", "issue_tracker_members"
  add_foreign_key "accident_images", "accident_records"
  add_foreign_key "accident_records", "departments"
  add_foreign_key "accident_records", "employees"
  add_foreign_key "accident_records", "root_cause_masters"
  add_foreign_key "approval_processes", "memberships"
  add_foreign_key "assigned_assets", "asset_types"
  add_foreign_key "assigned_assets", "employees"
  add_foreign_key "attendances", "employee_shifts"
  add_foreign_key "attendances", "employees"
  add_foreign_key "attendances", "shift_rotations"
  add_foreign_key "awards", "employees"
  add_foreign_key "awards", "years"
  add_foreign_key "bonus_employees", "employees"
  add_foreign_key "candidate_forms", "degrees"
  add_foreign_key "candidate_forms", "qualifications"
  add_foreign_key "candidate_forms", "vacancy_requests"
  add_foreign_key "candidate_interview_schedules", "candidate_forms"
  add_foreign_key "candidate_interview_schedules", "interview_type_masters"
  add_foreign_key "capture_resumes", "countries"
  add_foreign_key "capture_resumes", "degrees"
  add_foreign_key "capture_resumes", "districts"
  add_foreign_key "capture_resumes", "employee_designations"
  add_foreign_key "capture_resumes", "states"
  add_foreign_key "capture_resumes", "vacancy_masters"
  add_foreign_key "certificates", "certificate_masters"
  add_foreign_key "certifications", "employees"
  add_foreign_key "certifications", "years"
  add_foreign_key "change_designations", "employee_designations"
  add_foreign_key "change_designations", "employees"
  add_foreign_key "companies", "company_types"
  add_foreign_key "companies", "countries"
  add_foreign_key "companies", "districts"
  add_foreign_key "companies", "groups"
  add_foreign_key "companies", "states"
  add_foreign_key "company_locations", "companies"
  add_foreign_key "company_locations", "countries"
  add_foreign_key "company_locations", "districts"
  add_foreign_key "company_locations", "states"
  add_foreign_key "company_policies", "policy_types"
  add_foreign_key "company_time_masters", "shift_masters"
  add_foreign_key "daily_bill_detail_histories", "daily_bill_details"
  add_foreign_key "daily_bill_detail_histories", "travel_expence_types"
  add_foreign_key "daily_bill_details", "currency_masters"
  add_foreign_key "daily_bill_details", "travel_expence_types"
  add_foreign_key "daily_bill_details", "travel_requests"
  add_foreign_key "departments", "company_locations"
  add_foreign_key "departments", "department_types"
  add_foreign_key "districts", "states"
  add_foreign_key "due_actions", "due_details"
  add_foreign_key "due_actions", "due_employee_details"
  add_foreign_key "due_details", "due_employee_templates"
  add_foreign_key "due_details", "due_templates"
  add_foreign_key "due_details", "reporting_masters"
  add_foreign_key "due_employee_details", "due_details"
  add_foreign_key "due_employee_details", "due_employee_templates"
  add_foreign_key "due_employee_details", "due_templates"
  add_foreign_key "due_employee_details", "employees"
  add_foreign_key "due_employee_details", "reporting_masters"
  add_foreign_key "due_employee_templates", "due_templates"
  add_foreign_key "due_employee_templates", "employees"
  add_foreign_key "employee_arrear_items", "employee_arrears"
  add_foreign_key "employee_arrear_items", "salary_components"
  add_foreign_key "employee_arrears", "employees"
  add_foreign_key "employee_attendances", "company_time_masters"
  add_foreign_key "employee_attendances", "departments"
  add_foreign_key "employee_attendances", "employee_leav_requests"
  add_foreign_key "employee_attendances", "employee_week_offs"
  add_foreign_key "employee_attendances", "employees"
  add_foreign_key "employee_attendances", "holidays"
  add_foreign_key "employee_attendances", "machine_attendances"
  add_foreign_key "employee_attendances", "on_duty_requests"
  add_foreign_key "employee_bank_details", "banks"
  add_foreign_key "employee_bank_details", "employees"
  add_foreign_key "employee_daily_activities", "employees"
  add_foreign_key "employee_daily_activities", "project_masters"
  add_foreign_key "employee_documents", "employees"
  add_foreign_key "employee_gps_histories", "employee_gps"
  add_foreign_key "employee_gps_histories", "employees"
  add_foreign_key "employee_gps_histories", "members"
  add_foreign_key "employee_jc_lists", "employees"
  add_foreign_key "employee_jc_lists", "joining_checklist_masters"
  add_foreign_key "employee_leav_balances", "employees"
  add_foreign_key "employee_leav_balances", "leav_categories"
  add_foreign_key "employee_leav_requests", "employee_leav_balances"
  add_foreign_key "employee_leav_requests", "employees"
  add_foreign_key "employee_leav_requests", "leav_categories"
  add_foreign_key "employee_monthly_days", "employees"
  add_foreign_key "employee_monthly_days", "years"
  add_foreign_key "employee_nominations", "countries"
  add_foreign_key "employee_nominations", "districts"
  add_foreign_key "employee_nominations", "employees"
  add_foreign_key "employee_nominations", "families"
  add_foreign_key "employee_nominations", "illness_types"
  add_foreign_key "employee_nominations", "nomination_masters"
  add_foreign_key "employee_nominations", "relation_masters"
  add_foreign_key "employee_nominations", "states"
  add_foreign_key "employee_physicals", "employees"
  add_foreign_key "employee_promotions", "departments"
  add_foreign_key "employee_promotions", "employee_designations"
  add_foreign_key "employee_promotions", "employee_grades"
  add_foreign_key "employee_promotions", "employees"
  add_foreign_key "employee_resignations", "employees"
  add_foreign_key "employee_resignations", "leaving_reasons"
  add_foreign_key "employee_salary_templates", "employee_templates"
  add_foreign_key "employee_salary_templates", "employees"
  add_foreign_key "employee_salary_templates", "salary_components"
  add_foreign_key "employee_salary_templates", "salary_templates"
  add_foreign_key "employee_shifts", "employees"
  add_foreign_key "employee_shifts_shift_rotations", "employee_shifts"
  add_foreign_key "employee_shifts_shift_rotations", "shift_rotations"
  add_foreign_key "employee_task_to_dos", "employees"
  add_foreign_key "employee_templates", "employees"
  add_foreign_key "employee_templates", "salary_templates"
  add_foreign_key "employee_transfers", "companies"
  add_foreign_key "employee_transfers", "company_locations"
  add_foreign_key "employee_transfers", "departments"
  add_foreign_key "employee_transfers", "employee_categories"
  add_foreign_key "employee_transfers", "employee_designations"
  add_foreign_key "employee_transfers", "employees"
  add_foreign_key "employee_week_offs", "employees"
  add_foreign_key "employee_week_offs", "week_off_masters"
  add_foreign_key "employees", "blood_groups"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "company_locations"
  add_foreign_key "employees", "countries"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "districts"
  add_foreign_key "employees", "employee_code_masters"
  add_foreign_key "employees", "employee_types"
  add_foreign_key "employees", "nationalities"
  add_foreign_key "employees", "religions"
  add_foreign_key "employees", "states"
  add_foreign_key "employees", "sub_departments"
  add_foreign_key "employer_contributions", "employees"
  add_foreign_key "exit_interviews", "employee_resignations"
  add_foreign_key "exit_interviews", "employees"
  add_foreign_key "exit_interviews", "question_masters"
  add_foreign_key "experiences", "employees"
  add_foreign_key "families", "blood_groups"
  add_foreign_key "families", "employees"
  add_foreign_key "families", "relation_masters"
  add_foreign_key "families", "religions"
  add_foreign_key "food_deductions", "employees"
  add_foreign_key "food_deductions", "food_coupan_masters"
  add_foreign_key "goal_bunches", "employees"
  add_foreign_key "goal_bunches", "performance_calendars"
  add_foreign_key "goal_bunches", "periods"
  add_foreign_key "goal_ratings", "attribute_masters"
  add_foreign_key "goal_ratings", "goal_bunches"
  add_foreign_key "goal_ratings", "goal_perspectives"
  add_foreign_key "goal_ratings", "performance_calendars"
  add_foreign_key "goal_ratings", "periods"
  add_foreign_key "goal_ratings", "training_topic_masters"
  add_foreign_key "gps_dailies", "employee_gps"
  add_foreign_key "gps_dailies", "employees"
  add_foreign_key "gratuities", "employees"
  add_foreign_key "gratuities", "gratuity_masters"
  add_foreign_key "induction_activities", "employees"
  add_foreign_key "induction_activities", "induction_masters"
  add_foreign_key "induction_details", "employees"
  add_foreign_key "induction_details", "induction_masters"
  add_foreign_key "induction_templates", "employees"
  add_foreign_key "interview_analyses", "interview_attributes"
  add_foreign_key "interview_analyses", "interview_decisions"
  add_foreign_key "interview_analyses", "interview_evalutions"
  add_foreign_key "interview_analyses", "interview_rounds"
  add_foreign_key "interview_analyses", "interview_schedules"
  add_foreign_key "interview_analyses", "vacancy_request_histories"
  add_foreign_key "interview_reschedules", "employees"
  add_foreign_key "interview_reschedules", "interview_schedules"
  add_foreign_key "interview_round_reschedules", "employees"
  add_foreign_key "interview_round_reschedules", "interview_rounds"
  add_foreign_key "interview_round_reschedules", "interview_types"
  add_foreign_key "interview_rounds", "employees"
  add_foreign_key "interview_rounds", "interview_schedules"
  add_foreign_key "interview_rounds", "interview_types"
  add_foreign_key "interview_schedules", "employees"
  add_foreign_key "interview_schedules", "selected_resumes"
  add_foreign_key "investment_declarations", "employees"
  add_foreign_key "investment_declarations", "investment_heads"
  add_foreign_key "investment_heads", "sections"
  add_foreign_key "issue_histories", "employees"
  add_foreign_key "issue_histories", "issue_masters"
  add_foreign_key "issue_histories", "issue_requests"
  add_foreign_key "issue_histories", "issue_tracker_groups"
  add_foreign_key "issue_histories", "issue_tracker_members"
  add_foreign_key "issue_locker_histories", "issue_lockers"
  add_foreign_key "issue_locker_histories", "issue_requests"
  add_foreign_key "issue_locker_histories", "issue_tracker_members"
  add_foreign_key "issue_lockers", "issue_requests"
  add_foreign_key "issue_lockers", "issue_tracker_members"
  add_foreign_key "issue_masters", "issue_tracker_groups"
  add_foreign_key "issue_masters", "issue_types"
  add_foreign_key "issue_requests", "employees"
  add_foreign_key "issue_requests", "issue_masters"
  add_foreign_key "issue_requests", "issue_root_causes"
  add_foreign_key "issue_requests", "issue_tracker_groups"
  add_foreign_key "issue_requests", "issue_tracker_members"
  add_foreign_key "issue_root_causes", "issue_tracker_groups"
  add_foreign_key "issue_tracker_accesses", "issue_tracker_groups"
  add_foreign_key "issue_tracker_members", "employees"
  add_foreign_key "issue_tracker_members", "issue_tracker_groups"
  add_foreign_key "joining_details", "cost_centers"
  add_foreign_key "joining_details", "employee_categories"
  add_foreign_key "joining_details", "employee_designations"
  add_foreign_key "joining_details", "employee_grades"
  add_foreign_key "joining_details", "employees"
  add_foreign_key "joining_details", "payment_modes"
  add_foreign_key "joining_details", "reserved_categories"
  add_foreign_key "leave_c_offs", "employees"
  add_foreign_key "leave_cashables", "employees"
  add_foreign_key "leave_cashables", "leav_categories"
  add_foreign_key "leave_details", "leav_categories"
  add_foreign_key "leave_details", "salaryslips"
  add_foreign_key "leave_masters", "leav_categories"
  add_foreign_key "leave_records", "employee_leav_requests"
  add_foreign_key "leave_records", "employees"
  add_foreign_key "leave_records", "leav_categories"
  add_foreign_key "leave_status_records", "employee_leav_requests"
  add_foreign_key "leave_transfers", "employee_leav_balances"
  add_foreign_key "leave_transfers", "employees"
  add_foreign_key "leave_transfers", "leav_categories"
  add_foreign_key "loan_approvals", "loan_requests"
  add_foreign_key "loan_approvals", "loan_types"
  add_foreign_key "loan_approvals", "memberships"
  add_foreign_key "loan_emis", "loan_approvals"
  add_foreign_key "loan_requests", "loan_types"
  add_foreign_key "loan_requests", "memberships"
  add_foreign_key "machine_attendances", "employees"
  add_foreign_key "machine_attendances", "shift_masters"
  add_foreign_key "manager_histories", "employees"
  add_foreign_key "members", "companies"
  add_foreign_key "members", "company_locations"
  add_foreign_key "members", "departments"
  add_foreign_key "members", "employees"
  add_foreign_key "members", "roles"
  add_foreign_key "membership_balances", "memberships"
  add_foreign_key "membership_contributions", "memberships"
  add_foreign_key "memberships", "employees"
  add_foreign_key "memberships", "membership_types"
  add_foreign_key "monthly_arrears", "employees"
  add_foreign_key "monthly_expences", "employees"
  add_foreign_key "monthly_expences", "expencess_types"
  add_foreign_key "od_records", "employees"
  add_foreign_key "od_records", "on_duty_requests"
  add_foreign_key "od_status_records", "employees"
  add_foreign_key "od_status_records", "on_duty_requests"
  add_foreign_key "on_duty_requests", "employees"
  add_foreign_key "overtime_daily_records", "employees"
  add_foreign_key "overtime_month_records", "employees"
  add_foreign_key "overtime_salaries", "employees"
  add_foreign_key "particular_leave_records", "employee_leav_requests"
  add_foreign_key "particular_leave_records", "employees"
  add_foreign_key "particular_leave_records", "leav_categories"
  add_foreign_key "particular_od_records", "employees"
  add_foreign_key "particular_od_records", "on_duty_requests"
  add_foreign_key "particular_vacancy_requests", "employee_designations"
  add_foreign_key "particular_vacancy_requests", "employees"
  add_foreign_key "particular_vacancy_requests", "interview_schedules"
  add_foreign_key "particular_vacancy_requests", "selected_resumes"
  add_foreign_key "particular_vacancy_requests", "vacancy_masters"
  add_foreign_key "performance_calendars", "performance_activities"
  add_foreign_key "performance_calendars", "periods"
  add_foreign_key "pre_onboardings", "countries"
  add_foreign_key "pre_onboardings", "districts"
  add_foreign_key "pre_onboardings", "selected_resumes"
  add_foreign_key "pre_onboardings", "states"
  add_foreign_key "professional_tax_masters", "company_locations"
  add_foreign_key "promotion_histories", "departments"
  add_foreign_key "promotion_histories", "employee_categories"
  add_foreign_key "promotion_histories", "employee_designations"
  add_foreign_key "promotion_histories", "employee_grades"
  add_foreign_key "promotion_histories", "employee_promotions"
  add_foreign_key "promotion_histories", "employees"
  add_foreign_key "qualifications", "degree_streams"
  add_foreign_key "qualifications", "degree_types"
  add_foreign_key "qualifications", "degrees"
  add_foreign_key "qualifications", "employees"
  add_foreign_key "qualifications", "universities"
  add_foreign_key "qualifications", "years"
  add_foreign_key "recruiters", "employees"
  add_foreign_key "reimbursement_requests", "employees"
  add_foreign_key "reimbursement_requests", "reimbursement_heads"
  add_foreign_key "reimbursement_slabs", "employee_designations"
  add_foreign_key "reimbursement_slabs", "employee_grades"
  add_foreign_key "reimbursement_slabs", "reimbursement_heads"
  add_foreign_key "rembursments", "employees"
  add_foreign_key "rembursments", "rembursmentmasters"
  add_foreign_key "reporting_employee_transfers", "employee_transfers"
  add_foreign_key "reporting_master_rembursments", "rembursments"
  add_foreign_key "reporting_masters", "employees"
  add_foreign_key "reporting_masters_resigns", "employee_resignations"
  add_foreign_key "reporting_masters_resigns", "reporting_masters"
  add_foreign_key "reporting_masters_training_reqs", "reporting_masters"
  add_foreign_key "reporting_masters_training_reqs", "training_requests"
  add_foreign_key "reporting_masters_travel_requests", "travel_requests"
  add_foreign_key "reporting_masters_vacancy_masters", "vacancy_masters"
  add_foreign_key "resignation_histories", "employee_resignations"
  add_foreign_key "resignation_histories", "employees"
  add_foreign_key "resignation_histories", "leaving_reasons"
  add_foreign_key "resignation_histories", "reporting_masters"
  add_foreign_key "resignation_status_records", "employee_resignations"
  add_foreign_key "reward_recognitions", "reward_owners"
  add_foreign_key "reward_recognitions", "reward_types"
  add_foreign_key "rewards_allocations", "departments"
  add_foreign_key "rewards_allocations", "reporting_masters"
  add_foreign_key "rewards_allocations", "reward_types"
  add_foreign_key "rewards_pals", "employees"
  add_foreign_key "rewards_pals", "reporting_masters"
  add_foreign_key "rewards_pals", "reward_types"
  add_foreign_key "salary_comp_mappings", "salary_components"
  add_foreign_key "salary_component_templates", "salary_components"
  add_foreign_key "salary_component_templates", "salary_templates"
  add_foreign_key "salary_map_saps", "companies"
  add_foreign_key "salary_map_saps", "company_locations"
  add_foreign_key "salary_map_saps", "salary_components"
  add_foreign_key "salaryslip_components", "employee_templates"
  add_foreign_key "salaryslip_components", "salary_components"
  add_foreign_key "salaryslip_components", "salaryslips"
  add_foreign_key "salaryslips", "employee_templates"
  add_foreign_key "salaryslips", "employees"
  add_foreign_key "salaryslips", "salary_templates"
  add_foreign_key "salaryslips", "workingdays"
  add_foreign_key "selected_resumes", "degrees"
  add_foreign_key "selected_resumes", "vacancy_masters"
  add_foreign_key "shift_rotations", "company_shifts"
  add_foreign_key "shift_rotations", "departments"
  add_foreign_key "skillsets", "employees"
  add_foreign_key "slip_informations", "cost_centers"
  add_foreign_key "slip_informations", "departments"
  add_foreign_key "slip_informations", "employee_designations"
  add_foreign_key "slip_informations", "salaryslips"
  add_foreign_key "society_member_ships", "employees"
  add_foreign_key "states", "countries"
  add_foreign_key "status_c_offs", "employees"
  add_foreign_key "status_c_offs", "leave_c_offs"
  add_foreign_key "sub_departments", "departments"
  add_foreign_key "texable_amounts", "employees"
  add_foreign_key "texable_monthly_deductions", "employees"
  add_foreign_key "texable_monthly_deductions", "salaryslips"
  add_foreign_key "trainee_requests", "employees"
  add_foreign_key "trainee_requests", "reporting_masters"
  add_foreign_key "trainee_requests", "training_requests"
  add_foreign_key "trainee_requests", "training_topic_masters"
  add_foreign_key "trainees", "employees"
  add_foreign_key "trainees", "training_plans"
  add_foreign_key "training_approvals", "employees"
  add_foreign_key "training_approvals", "reporting_masters"
  add_foreign_key "training_approvals", "training_requests"
  add_foreign_key "training_approvals", "training_topic_masters"
  add_foreign_key "training_plans", "periods"
  add_foreign_key "training_plans", "training_topic_masters"
  add_foreign_key "training_records", "employees"
  add_foreign_key "training_records", "training_topic_masters"
  add_foreign_key "training_requests", "employees"
  add_foreign_key "training_requests", "reporting_masters"
  add_foreign_key "training_requests", "training_topic_masters"
  add_foreign_key "transfer_histories", "companies"
  add_foreign_key "transfer_histories", "company_locations"
  add_foreign_key "transfer_histories", "departments"
  add_foreign_key "transfer_histories", "employee_categories"
  add_foreign_key "transfer_histories", "employee_designations"
  add_foreign_key "transfer_histories", "employee_transfers"
  add_foreign_key "transfer_histories", "employees"
  add_foreign_key "travel_expences", "travel_requests"
  add_foreign_key "travel_request_histories", "employees"
  add_foreign_key "travel_request_histories", "travel_modes"
  add_foreign_key "travel_request_histories", "travel_options"
  add_foreign_key "travel_request_histories", "travel_requests"
  add_foreign_key "travel_requests", "employees"
  add_foreign_key "travel_requests", "travel_modes"
  add_foreign_key "travel_requests", "travel_options"
  add_foreign_key "vacancy_masters", "companies"
  add_foreign_key "vacancy_masters", "company_locations"
  add_foreign_key "vacancy_masters", "cost_centers"
  add_foreign_key "vacancy_masters", "degrees"
  add_foreign_key "vacancy_masters", "departments"
  add_foreign_key "vacancy_masters", "employee_designations"
  add_foreign_key "vacancy_masters", "employees"
  add_foreign_key "vacancy_masters", "sub_departments"
  add_foreign_key "vacancy_masters", "target_companies"
  add_foreign_key "vacancy_request_histories", "company_locations"
  add_foreign_key "vacancy_request_histories", "degrees"
  add_foreign_key "vacancy_request_histories", "departments"
  add_foreign_key "vacancy_request_histories", "employee_designations"
  add_foreign_key "vacancy_request_histories", "employees"
  add_foreign_key "vacancy_request_histories", "reporting_masters"
  add_foreign_key "vacancy_request_histories", "vacancy_masters"
  add_foreign_key "vacancy_request_statuses", "vacancy_requests"
  add_foreign_key "vacancy_requests", "departments"
  add_foreign_key "vacancy_requests", "employee_designations"
  add_foreign_key "visitor_details", "employees"
  add_foreign_key "week_off_masters", "employees"
  add_foreign_key "workingdays", "employees"
end
