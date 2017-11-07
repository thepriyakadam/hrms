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

ActiveRecord::Schema.define(version: 20171107095442) do

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
    t.integer  "advance_type_id",   limit: 4
    t.decimal  "interest",                      precision: 15, scale: 2
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "advance_salaries", ["advance_type_id"], name: "index_advance_salaries_on_advance_type_id", using: :btree
  add_index "advance_salaries", ["employee_id"], name: "index_advance_salaries_on_employee_id", using: :btree

  create_table "advance_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "is_confirm"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "interest"
    t.decimal  "rate",                    precision: 10
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
    t.integer  "policy_type_id",        limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
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

  create_table "contact_details", force: :cascade do |t|
    t.integer  "employee_id", limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "role1",       limit: 255
    t.string   "role2",       limit: 255
    t.string   "role3",       limit: 255
    t.string   "role4",       limit: 255
    t.string   "role5",       limit: 255
    t.string   "role6",       limit: 255
    t.string   "role7",       limit: 255
    t.string   "role8",       limit: 255
  end

  add_index "contact_details", ["employee_id"], name: "index_contact_details_on_employee_id", using: :btree

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
    t.integer  "reporting_master_id",         limit: 4
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
    t.string   "comment",                  limit: 255
    t.datetime "created_at",                                                                    null: false
    t.datetime "updated_at",                                                                    null: false
    t.integer  "employee_week_off_id",     limit: 4
    t.integer  "holiday_id",               limit: 4
    t.string   "title",                    limit: 255
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
  end

  add_index "employee_gps_histories", ["employee_gp_id"], name: "index_employee_gps_histories_on_employee_gp_id", using: :btree
  add_index "employee_gps_histories", ["employee_id"], name: "index_employee_gps_histories_on_employee_id", using: :btree

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

  create_table "employee_plans", force: :cascade do |t|
    t.integer  "employee_id",    limit: 4
    t.date     "from_date"
    t.date     "to_date"
    t.time     "from_time"
    t.time     "to_time"
    t.string   "meeting_with",   limit: 255
    t.string   "location",       limit: 255
    t.text     "meeting_agenda", limit: 65535
    t.string   "lat",            limit: 255
    t.string   "lng",            limit: 255
    t.boolean  "conform"
    t.boolean  "status"
    t.string   "current_status", limit: 255
    t.integer  "manager_id",     limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
  end

  add_index "employee_plans", ["employee_id"], name: "index_employee_plans_on_employee_id", using: :btree

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
    t.integer  "employee_id",               limit: 4
    t.date     "resignation_date"
    t.string   "reason",                    limit: 255
    t.boolean  "is_notice_period"
    t.string   "notice_period",             limit: 255
    t.string   "short_notice_period",       limit: 255
    t.date     "tentative_leaving_date"
    t.text     "remark",                    limit: 65535
    t.date     "exit_interview_date"
    t.text     "note",                      limit: 65535
    t.date     "leaving_date"
    t.date     "settled_on"
    t.boolean  "has_left"
    t.boolean  "notice_served"
    t.boolean  "rehired"
    t.string   "resign_status",             limit: 255
    t.integer  "leaving_reason_id",         limit: 4
    t.integer  "reporting_master_id",       limit: 4
    t.integer  "change_status_employee_id", limit: 4
    t.boolean  "is_stop_pay_request"
    t.integer  "second_reporter_id",        limit: 4
    t.integer  "final_reporter_id",         limit: 4
    t.boolean  "is_pending"
    t.boolean  "is_first_approved"
    t.boolean  "is_second_approved"
    t.boolean  "is_final_approved"
    t.boolean  "is_cancelled"
    t.boolean  "is_first_rejected"
    t.boolean  "is_second_rejected"
    t.boolean  "is_final_rejected"
    t.datetime "application_date"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
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
    t.integer  "reporting_master_id",       limit: 4
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
    t.string   "optinal_contact_no1",             limit: 255
    t.string   "email",                           limit: 255
    t.string   "optional_email",                  limit: 255
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
    t.integer  "sub_department_id",               limit: 4
    t.string   "extension_no",                    limit: 255
    t.string   "emergency_contact_no",            limit: 255
    t.string   "employee_signature_file_name",    limit: 255
    t.string   "employee_signature_content_type", limit: 255
    t.integer  "employee_signature_file_size",    limit: 4
    t.datetime "employee_signature_updated_at"
    t.integer  "service_master_id",               limit: 4
    t.integer  "resource_pool_master_id",         limit: 4
    t.integer  "cost_center_id",                  limit: 4
  end

  add_index "employees", ["blood_group_id"], name: "index_employees_on_blood_group_id", using: :btree
  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree
  add_index "employees", ["company_location_id"], name: "index_employees_on_company_location_id", using: :btree
  add_index "employees", ["cost_center_id"], name: "index_employees_on_cost_center_id", using: :btree
  add_index "employees", ["country_id"], name: "index_employees_on_country_id", using: :btree
  add_index "employees", ["department_id"], name: "index_employees_on_department_id", using: :btree
  add_index "employees", ["district_id"], name: "index_employees_on_district_id", using: :btree
  add_index "employees", ["employee_code"], name: "index_employees_on_employee_code", using: :btree
  add_index "employees", ["employee_code_master_id"], name: "index_employees_on_employee_code_master_id", using: :btree
  add_index "employees", ["employee_type_id"], name: "index_employees_on_employee_type_id", using: :btree
  add_index "employees", ["nationality_id"], name: "index_employees_on_nationality_id", using: :btree
  add_index "employees", ["religion_id"], name: "index_employees_on_religion_id", using: :btree
  add_index "employees", ["resource_pool_master_id"], name: "index_employees_on_resource_pool_master_id", using: :btree
  add_index "employees", ["service_master_id"], name: "index_employees_on_service_master_id", using: :btree
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

  create_table "events", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.date     "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "excel_uploads", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "file_name",  limit: 255
    t.string   "size",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "exit_interviews", force: :cascade do |t|
    t.integer  "employee_id",        limit: 4
    t.integer  "question_master_id", limit: 4
    t.text     "answer",             limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "exit_interviews", ["employee_id"], name: "index_exit_interviews_on_employee_id", using: :btree
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

  create_table "faqs", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "question",    limit: 255
    t.string   "answer",      limit: 255
    t.integer  "employee_id", limit: 4
    t.boolean  "status"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "faqs", ["employee_id"], name: "index_faqs_on_employee_id", using: :btree

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

  create_table "frequest_questions", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.text     "question",    limit: 65535
    t.text     "answer",      limit: 65535
    t.integer  "employee_id", limit: 4
    t.boolean  "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "frequest_questions", ["employee_id"], name: "index_frequest_questions_on_employee_id", using: :btree

