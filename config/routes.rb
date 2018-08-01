Rails.application.routes.draw do

  resources :email_reminders do
    collection do
      get :modal_show
    end
  end
  resources :tasks

  resources :employee_insentives do
    collection do
      get :show_employee_insentive
      get :employee_insentive_month
      get :import_employee_insentive
      post :import
    end
  end
  resources :attendance_regularizations do 
    collection do
      get :admin_level_approval
      get :show_attendance_regularization
      get :attendance_regularization_approve
      get :approve_attendance
      get :rejected_attendance
      get :emp_attendance_details
      get :date_wise_regularization
      get :att_regularization_report
      post :att_regularization_report
      get :employee_wise_regularization
      get :employee_wise_regularization_report
      post :employee_wise_regularization_report
    end
  end
  resources :regularization_reasons

  resources :food_options
  resources :compliance_records do
    collection do
      get :periodwise_report
      post :show_compliance_record
    end
  end
  resources :agencies
  resources :transaction_records do
    collection do
      get :modal_show
    end
  end
  resources :compliance_types
  resources :galleries 
  resources :pictures
  resources :monthly_income_taxes
  resources :quarter_income_taxes
  resources :income_tax_masters
  resources :gps_informations do
    collection do
      get :all_emp_list
      get :view_gps_info
      post :update_gps_info
    end
  end
  resources :event_details
  resources :latemark_deductions
  resources :latemark_masters do
    collection do
      get :latemark_calculation
      post :show_employee_list
      get :show_employee_list
      post :calculate_latemark
      get :latemark_total
      get :latemark_report
      post :show_datewise_report
      get :show_datewise_report
      get :datewise_report
      get :import_xl
      post :import
      get :revert_latemark
      post :revert_latemark_value
      get :deduction_report
      post :show_deduction_report
      get :show_deduction_report
      post :show_list_for_latemark
      get :revert_latemark_value
    end
  end
  resources :meeting_follow_ups do
    collection do
      get :view_meeting_follow_up
    end
  end
  
  resources :meeting_minutes do
    collection do
      get :view_minutes
      get :minutes_form
    end
  end
  
  resources :listed_companies do
    collection do
      get :view_company
    end
  end
  resources :transport_allowances
  resources :events
  resources :resource_pool_masters
  resources :service_masters

  resources :daily_attendances do 
    collection do
      get :third_attendance_uttam
      get :attendance
      get :calculate
      get :daily_attendance
      post :daily_attendance
      get :daily_attendances_report
      post :daily_attendances_report
    end
  end

  resources :plan_reason_masters do
    collection do
      get :view_resaon
    end
  end
  
  resources :policy_details do
    collection do
      get :policy_details_modal
    end
  end

  resources :medicle_reimbursements do
    collection do
      get :medicle_reimbursements_modal
    end
  end  

  resources :income_loss_house_properties do
    collection do
      get :income_loss_house_property_modal
    end
  end
  
  resources :interest_on_housing_loans do
    collection do
      get :houseloan_interest_modal
    end
  end     

  resources :housing_rents do
    collection do
      get :housing_rent_modal
    end  
  end  

  resources :leave_travel_assistances do
    collection do
      get :leave_travel_assistance_modal
    end
  end    
  
  resources :employee_plans do
    collection do
      post :meeting_follow_up_record
      get :meeting_follow_up_record
      post :follow_up_record_form
      get :follow_up_record_form
      get :meeting_follow_up
      get :meeting_follow_up_report
      post :meeting_follow_up_report
      get :meeting_minutes_history
      get :meeting_minutes_history_report
      post :meeting_minutes_history_report
      post :plan_meeting_minutes
      get :plan_meeting_minutes 
      get :gps_tracking
      get :employee_gps_tracking
      post :employee_gps_tracking
      get :status_wise_report
      get :status_report
      post :status_report
      get :print_employee_wise_report
      get :print_manager_wise_report
      get :employee_wise_report
      get :manager_wise_report
      post :employee_report_data
      get :employee_report_data
      post :manager_report
      get :manager_report
      get :company_wise_report
      get :company_report
      post :company_report
      get :modal_employee_plan_detail
      get :employee_plan_detail_list
      get :ajax_employee_plan_details
      get :meeting_plan_approval
      get :plan_approve
      get :plan_reject
      get :view_plan
      get :arrange_meeting
      get :employee_reason
      get :employee_feedback
      post :feedback
      post :reason
      get :minutes_form
      get :start_meeting
      get :end_meeting
    end
  end
  resources :events  # do
  #   collection do
  #     get :user_events
  #   end
  # end

  resources :contact_details do
    collection do
      get :modal_contact_detail
      get :import_xl
      post :import
    end
  end
  resources :frequest_questions do
    collection do
      get :frequest_question_master
      get :frequest_question_modal
      get :list_of_faq
      get :import_xl
      post :import
    end
  end
  resources :target_companies do
    collection do
      get :target_company_master
      post :target_company_master
      get :import_xl
      post :import
    end
   end
    
  resources :daily_attendances do 
    collection do
      get :attendance
      get :calculate
    end
  end
  resources :leave_transfers do
    collection do
      get :leave_transfer_approval
      get :show_detail_for_approval
      get :approve
      get :reject
      get :employee_wise_report
      post :show_employeewise_detail
      get :show_employeewise_detail
      get :modal_transfer_detail
    end
  end
  resources :sub_departments
  resources :change_designations do
    collection do
      get :employee_list
      get :change_designation_history
      get :modal
      get :print_designation
      get :excel_designation
      get :employee_record_detail
    end
  end
  resources :pre_onboardings
  resources :change_designations
  resources :loan_emis
  resources :approval_processes
  resources :loan_requests do
    collection do
      get :loan_approval
      get :approve_loan_request
      get :first_approve
      get :reject
      get :final_approve
      get :final_loan_request
      get :final
    end
  end
  resources :loan_types
  resources :membership_contributions
  resources :memberships
  resources :membership_types
  resources :punch_masters
  resources :recruiters do
    collection do
      get :final_approve_modal
      post :final_approve_request
      get :recruiter_master
      post :recruiter_master
      get :import_xl
      post :import
    end
  end
  resources :candidate_interview_schedules do
    collection do
      get :interview
      get :modal
    end
  end
  resources :greetings do
    collection do
      get :modal_for_mail
      post :send_mail
      get :anniversary_mail
      post :send_anniversary_mail
    end
  end
  resources :thoughts do
    collection do
      get :thought_master
      get :import_xl
      post :import
    end
  end
  resources :candidate_interview_schedules
  resources :interview_type_masters
  # resources :interview_types 
  resources :candidate_forms
  resources :vacancy_request_statuses
  # resources :interview_types
  resources :vacancy_requests do
    collection do
      get :cancel
      get :approval_list
      get :approval_detail
      get :first_approve
      get :approve
      get :reject
      get :final_approve
      get :final_approval_list
      get :approve_and_send_next
      get :modal_approve_and_send_next
      get :select_candidate
      get :admin_approval
      get :admin_approval_detail
      get :recruiter_modal
      post :final_approve
    end
  end
  resources :policy_types do 
    collection do 
      get :policy_type_master
      post :policy_type_master
      get :import_xl
      post :import
      get :modal
    end
  end

  resources :reimbursement_requests do
    collection do
      get :send_for_approval
      get :approval_list
      get :approve
      get :reject
      get :edit_request_modal
      post :update_request_modal
      get :modal
    end
  end
  resources :reimbursement_slabs do
    collection do
      get :modal
    end
  end
  resources :reimbursement_heads
  resources :reporting_master_rembursments
  resources :rembursments  do
    collection do
      get :approval_list
      get :approval_detail
      get :first_approve
      get :approve
      get :reject
      get :final_approve
      get :final_approval_list
      get :approve_and_send_next
      get :modal_approve_and_send_next
      get :cancel
    end
  end
  resources :rembursmentmasters do
    collection do
      get :rembursment_master
      get :rembursment_master
      get :import_xl
      post :import
    end
  end
  resources :employee_jc_lists
  resources :joining_checklist_masters do
    collection do
      get :joining_checklist_master
      post :joining_checklist_master
      get :import_xl
      post :import
    end
  end
  resources :employee_gps do
    collection do
      get :employee_wise_gps
      post :show_set_gps_employeewise
      post :set_employeewise_gps
      get :employeewise_daily_gps
      post :show_employeewise_daily_gps
    end
  end
  resources :payroll_periods
  resources :visitor_details do
    collection do
      get :display_visiting_card
      get :print_visitor_card
      get :visitor_date_report
      post :print_visitor_report
      get :print_visitor_report
      get :visitor_list
      get :show_detail

    end
  end

  resources :slabs do
    collection do
      get :employee_list
      get :apply_tds
      get :deduction_list
      get :modal
    end
  end
  resources :employee_gps_histories
  resources :gratuities

  resources :gratuity_masters do
    collection do
      get :is_confirm
      get :gratuity_master_modal
    end
  end
  resources :monthly_arrears  do
    collection do
      get :modal
    end
  end
  resources :on_duty_requests do
    collection do
      get :select_checkbox
      get :request_approval_list
      get :employee_od_request_detail
      get :employee_list
      get :from_hr
      get :hr_view_request
      get :show_od_record
      get :od_request_list
      get :employee_od_request_detil_for_admin
      get :on_duty_request_report
      post :request_report
      get :request_report
      get :on_duty_request_status_report
      get :status_wise_report_list
      post :status_wise_report_list
      get :on_duty_approval_report
      get :approved_record_list
      get :show_approved_record
      post :show_approved_record
      get :request_modal
    end
  end

  resources :manager_self_services do
    collection do
      get :reporties_list
      get :reporties_profile_modal
      get :subordinate_list
      get :appraiser_subordinate
      get :reviewer_subordinate
      get :employee_list
      get :approved_or_rejected_leave_request
      get :all_leave_request_list
      get :request_approval_list
      get :od_request_list
      get :training_request_list
      get :final_approval_training_list
      get :resignation_history
      get :final_approval_emp_resignation_list
      get :employee_attendance
      post :show_datewise_attendance
      get :investment_declaration
      get :investment_declaration_list
      post :reject_declaration
      get :leave_c_off
      get :subordinate_attendance
      post :show_subordinate_attendance
      get :show_subordinate_attendance
      post :vacancy_request_create
      get :vacancy_request
      get :final_approve_modal
      get :employee_resignation_history
    end
  end

  resources :od_status_records do
    collection do
      get :cancel_after_approve
    end
    member do
      get :cancel
      get :first_approve
      get :second_approve
      get :first_reject
      get :second_reject
    end
  end
  resources :employee_week_offs do
    collection do
      get :revert_week_off
      post :employee_week_off_list
      get :edit_week_off_modal
      post :edit_week_off
      get :date_wise_week_off
      post :show_date_wise_weekoff
      get :show_date_wise_weekoff
      get :revert_selective
      post :show_employee_list
      post :revert_selective_week_off
      post :revert_selective_data
      get :datewise_report
      post :show_datewise_employee
      get :show_datewise_employee
    end
  end
  resources :late_mark_masters do
    collection do
      get :is_confirm
    end
  end
  resources :certificates do
    collection do
      get :certificate_form
      get :certificate_print
      get :employee
      post :selected_employee_list
      get :selected_employee_pdf
      get :selected_employee_xls
      get :offer_letter
      get :joining_letter
    end
  end
  resources :certificate_masters do
    collection do
      get :is_confirm
    end
  end
  resources :shift_masters do
    collection do
      get :is_confirm
    end
  end
  resources :payroll_overtime_masters do
    collection do
      get :is_confirm
      get :payroll_overtime_masters_modal
      end
  end
  resources :leave_cash_masters do
    collection do
      get :is_confirm
      end
  end

  resources :leave_cashables do
    collection do
      get :collect_amount
    end
  end
  resources :week_off_masters do
    collection do
      post :assign_week_off
      post :employee_list
      post :create_week_off
      get :week_off_list
      get :edit_modal
      post :update_week_off
      get :revert_week_off_master
      post :show_weekoff_master_data
      get :revert_master_data
      get :show_employee_attendance
    end
  end
  resources :machine_attendances do
    collection do
      get :new
      post :create
      post :save_machine_attendance
      post :save_machine_attendance_checkbox
      get :import_machine_attendance
      post :import
      get :modal
      post :edit_machine_attendance
      get :machine_attendance_xls
      get :machine_attendance_pdf
      get :import_machine_attendance_to_txt
    end
  end
  resources :company_time_masters do
    collection do
      get :is_confirm
      get :edit
      get :update
    end
  end
  resources :pf_employers do
    collection do
      get :is_confirm
      get :pf_employers_modal
    end
  end
  resources :esic_employers do
    collection do
      get :is_confirm
      get :esic_employers_modal
    end
  end
  resources :bonus_employers do
    collection do
      get :is_confirm
      get :bonus_employers_modal
    end
  end
  resources :professional_tax_masters do
    collection do
      get :is_confirm
      get :pf_tax_master_modal
    end
  end
  resources :dearness_allowances do
    collection do
      get :is_confirm
      get :dearness_allowances_modal
    end
  end
  resources :employer_insurances do
    collection do
      get :is_confirm
      get :employer_insurances_modal
    end
  end
  resources :employer_family_pensions do
    collection do
      get :is_confirm
      get :employer_family_pensions_modal
    end
  end

  resources :insurance_masters do
    collection do
      get :is_confirm
    end
  end
  resources :fp_masters do
    collection do
      get :is_confirm
    end
  end
  resources :esic_employer_masters do
    collection do
      get :is_confirm
    end
  end
  resources :da_masters do
    collection do
      get :is_confirm
    end
   end
  get 'issue_request_report/index'
  get 'welcome/index'

  resources :issue_root_causes do
    collection do
      get :is_confirm
    end
   end
  resources :issue_histories
  resources :access_issue_requests
  resources :issue_locker_histories
  resources :issue_lockers
  resources :issue_requests do
    collection do
      get :is_confirm
      get :lock_request_list
      post :lock_request
      get :coordinator_lock_request
      get :modal
      get :modal1
      get :issue_history
      get :unlock_request
      post :solved_request
      get :solved_issues
      get :lock_by_admin
      get :unlock_by_admin
      get :solved_confirm
      get :resend_request
      post :datewise_report_list
      get :datewise_report
      get :datewise_report_xls
      get :datewise_report_pdf
      get :issue_tracker_reports_xls
      get :issue_tracker_pdf
      get :groupwise_report
      get :group_report_list
      get :request_id_wise_report
      get :request_id_wise_list
      get :id_wise_report_xls
      get :id_wise_report_pdf
      get :memberwise_report
      post :memberwise_report_list
      get :memberwise_report_list_xls
      get :memberwise_report_list_pdf
      get :select_description
      get :request_detail_modal
      get :solved_issue_list
    end
   end
  resources :issue_masters do
    collection do
      get :collect_issues
       get :is_confirm
       get :modal
       
    end
  end
  resources :issue_types do
    collection do
      get :is_confirm
    end
   end
  resources :issue_tracker_accesses

  resources :issue_tracker_members do
    collection do
      get :is_confirm
       get :collect_issues
       get :collect_memberwise_dropdown
    end
   end
  resources :issue_tracker_groups do
    collection do
      get :is_confirm

  end
end

  resources :leave_masters do
    collection do
      get :modal_leave_master
    end
  end

  resources :employee_code_masters do
    collection do
       get :is_confirm
      get :select_textbox
      get :employee_code_master
      post :employee_code_master
      get :import_xl
      post :import
    end
   end
  get 'download_pdf/index'
  get 'download_pdf/zip'
  get 'download_pdf/pdf'
  get 'download_pdf/doc'

   resources :certificates do
    collection do
      # get :show_joining_date
      post :certificate_print
      get :address_pdf
      get :address_proof
      get :character_certificate
      get :display_certificate
      get :service_certificate
      get :joining_letter
      get :offer_letter
    end
   end
  resources :due_actions do
    collection do
       post :confirm_employee_due_action
    end
   end
  resources :due_details do
    collection do
      get :all_employee_resignation_list
      get :due_detail_history
      post :is_confirm
      get :all_due_template
      get :show_due_template_list
      post :create_due_employee_detail
      get :employee_due_detail_history
      get :all_employee_due_detail
      post :is_confirm_employee_due
      get :due_employee_detail_list
      get :due_action_list
      get :emp_resignation
      get :modal
      get :due_employee_detail_history
      get :all_employee_list
      get :specific_due_action_list
      get :emp_resignation_list
      get :due_clearence_list
      get :full_and_final_settlement
      get :emp_salary_list
      get :show_full_and_final_employee
    end
  end

  resources :employee_transfers do
    collection do
      get :transfer_request
      get :employee_transfer_confirmation
      get :approve_transfer
      get :reject_transfer
      get :modal_approve
      post :send_request_to_higher_authority
      get :modal_edit
      patch :update_transfer_details
      get :modal_edit_and_send_next
      post :update_and_send_next_transfer_details
      get :first_approve
      get :approve_and_send_next
      get :final_approve
      get :final_approval_transfer_list
      get :approve_employee_transfer
      get :employee_transfer_confirmation_2
      post :final_approve
      get :transfer_employee_name_report
      get :print_transfer_employee_name_report
      post :print_transfer_employee_name_report
      get :transfer_employee_name_report_pdf
      get :transfer_employee_name_report_xls
      get :admin_employee_transfer
      post :final_approve_by_admin
      get :collect_company
    end
  end

  resources :due_details
  resources :due_templates
  resources :employee_transfers
  resources :rewards_pals
  resources :rewards_allocations
  resources :reward_recognitions
  resources :reward_types do
    collection do
      get :is_confirm
    end
  end
  resources :reward_owners do
    collection do
      get :is_confirm
    end
  end
  resources :recognition_types

  resources :investment_declarations do
    collection do
      get :manager_view
      get :approve_declaration
      post :approve_declaration
      get :reject_declaration
      post :reject_declaration
      get :approve_declaration_modal
      get :reject_declaration_modal
      get :self_edit_modal
      post :self_update
      get :send_for_approval
      get :cancel_request
      get :delete_request
      get :datewise_report
      post :show_datewise_report
      get :show_datewise_report
      get :modal
      get :employee_declaration
      get :add_employee_declaration
      get :edit_employee_declaration
      get :show_employee_declaration
      post :update_employee_declaration
      get :policy_details_modal
      post :policy_details_modal
      post :document_upload
      get :download_document
      get :show_declaration_details
      get :show_employee_declaration
      get :display_declaration_details
      get :upload_file_modal
      get :add_amount_modal
      post :show_policy_details
      get :medicle_reimbursement_modal
      post :show_medicle_reimbursement_details
      get :leave_travel_assistance_modal
      get :housing_rent_modal
      post :show_housing_rent_details
      get :houseloan_interest_modal
      post :show_housingloan_details
      get :income_loss_house_property_modal
      post :show_income_loss_house_property_details
      get :update_amount
      post :update_amount
      get :houseloan_interest_modal
      get :approve_employee_declaration
    end
  end
  resources :investment_heads
  resources :sections
  resources :employee_documents do
    collection do
      get :form16
      post :create_self_declaration
      get :modal
      post :update_document
    end
  end

  resources :company_policies do
    collection do
      get :active_policies_list
      get :policy_type_detail
      get :policy_type_dashboard
      get :modal
      post :update_company_policy
      get :email
    end
  end

  resources :date_formats do
    collection do
    get :active
    post :activee
    end
  end

  resources :email_configs
  resources :currency_masters do
    collection do
      get :is_confirm
      get :currency_master
      post :currency_master
    end
  end
  resources :illness_types do
    collection do
      get :is_confirm
      get :illness_type_master
      post :illness_type_master
      get :import_xl
      post :import
    end
  end
  resources :performance_calendars do
    collection do
      get :performance_calendar
      get :is_confirm
      get :import_xl
      post :import
    end
  end
  resources :performance_activities do
    collection do
      get :performance_activity
      get :is_confirm
      get :import_xl
      post :import
    end
  end

  resources :years do
    collection do
      get :is_confirm
      get :import_xl
      post :import
    end
  end

  resources :employee_daily_activities do
    collection do
      get :employee_details
      get :daily_show_activity_list
      get :activity_report
    end
  end
  resources :project_masters do
    collection do
      get :is_confirm
    end
  end
  resources :attribute_masters do
    collection do
      get :is_confirm
      get :modal
      get :attribute_master
      post :attribute_master
      get :import_xl
      post :import
    end
  end
  resources :circulars do
    collection do
      get :is_confirm
      get :email
    end
  end

  resources :salary_map_saps
  resources :interview_rounds do
    collection do
      get :interview_round_reschedule
      post :reschedule_interview
      get :interview_reschedule_list
      post :confirm_interview_round
    end
  end
  resources :interview_types do
    collection do
      get :is_confirm
      get  :interview_type_master
      post :interview_type_master
      get :import_xl
      post :import
    end
  end
  resources :employee_attendances do
    collection do
      post :third_attendance
      get :third_attendance
      post :fetch_attendance
      post :calculate
      get :fetch_attendance
      get :calculate
      get :employee_not_found
      post :not_found
      post :department_wise_employee_list
      post :all_emp_list
      post :create_employee_attendance
      get :attendance
      get :revert_attendance
      post :show_employee
      post :destroy_employee_attendance
      post :department_wise_emp
      post :create_attendance
      get :monthly_attendance
      get :costcenter_wise_attendance
      get :show_costcenter_wise_attendance
      post :show_costcenter_wise_attendance
      post :display_attendance
      get :revert_attendance_employeewise
      post :show_employee_list
      post :destroy_attendance_employeewise
      get :loginwise_attendance_form
      get :display_employee_attendance_list
      get :employee_attendances_list
      get :calculate_attendance
      get :display_total
      post :display_total
      get :attendance_total_xls
      get :emp_attendance
      get :display_attendance_2
      post :display_attendance_2
      get :payroll_report
      get :costcenter_wise_excel1
      get :costcenter_wise_pdf
      get :employee_attendance_excel_report
      get :employee_attendance_pdf_report
      get :attendance_total_pdf
      get :emp_attendance_1
      post :attendance_report
      get :confirm_attendance_form
      post :confirm_attendance
      post :create_attendance_1
      get :emp_attendance_1_list
      post :display_attendance_1
      get :select_date_department_form
      post :show_departmntwise_employee
      get :show_departmntwise_employee
      post :show_departmntwise_employee
      get :department_wise_pdf
      get :department_wise_xls
      get :search_by_date

      get :date_wise_pdf
      get :date_wise_xls
      get :select_from_and_to_date
      post :show_from_and_to_date
      get :show_from_and_to_date
      get :from_date_wise_xls
      get :from_date_wise_pdf
      get :datewise_attendance
      post :show_datewise_attendance
      post :create_attendance_datewise

      get :manager_attendance_form
      get :display_attendance_for_manager

      post :import
      get :import_employee_attendance
      get :import_employee_attendance_to_txt

      get :self_service_datewise_attendance
      get :manager_self_service_attendance
      get :datewise_report
      post :show_datewise_report
      get :show_datewise_report

      post :upload
      get :upload_daily_attendance
      get :upload_daily_attendance_to_txt
      get :datewise_daily_attendance
      post :show_datewise_daily_attendance
      get :modal_edit_daily_attendance
      post :update_daily_attendance
      post :update_daily_attendance
      post :create_self_attendance
      get :daily_attendance_datewise
      post :show_daily_attendance_datewise
      get :select_date_and_employee
      post :date_and_employeewise_attendance
      get :destroy_daily_attendance
      post :show_daily_attendance_for_destroy
      post :destroy_daily_attendance_datewise
      get :modal_edit_for_show
      post :modal_edit_for_show
      post :update_attendance_for_show
      get :update_attendance_for_show
      get :access_record
      post :access_card_list
      get :access_card_approval
      get :admin_access_card_approval
      get :view_access_card_detail
      get :approve_acf_request
      get :reject_acf_request
      get :admin_level_acf
      post :admin_acf_approval
      get :attendance_average_report
      post :attendance_average_details
      get :attendance_average_details
      get :managerwise_average_report
      post :show_managerwise_average_attendance
      get :show_managerwise_average_attendance
      get :datewise_attendance_with_options
      post :show_datewise_all
      get :show_datewise_all
      get :show_datewise_all_report
      get :create_in_time
      get :create_out_time
      get :in_out_summary
      post :show_in_out_summary
      get :modal_missing_record
      get :attendance_summary
      post :show_attendance_summary
      get :show_attendance_summary
      post :payroll_show
      get :payroll_show
      get :employee_attendance
      get :import_xl
      post :attendance_upload_report
    end
  end
  resources :salary_comp_mappings
  resources :company_events do
    collection do
      get :event_detail
      get :show_event
      get :email
    end
  end
  resources :employee_task_to_dos do
    collection do
      get :dynamic_refresh
    end
  end


  resources :leaving_reasons do
    collection do
      get :is_confirm
      get :leaving_reason_master
      post :leaving_reason_master
      get :import_xl
      post :import
    end
  end
  resources :training_records
  resources :induction_details do
    collection do
    get :all_induction_detail_list
    get :confirm
    get :print_induction_details
    get :update_date_modal
    post :update_date
    end
  end
  resources :induction_activities do
    collection do
    get :employee_list
    get :search_template
    get :find_assigned_induction_template
    get :all_induction_document_download
    post :induction_activity
    get :induction_activity_download_list
    post :create_induction_detail
    get :modal_induction_activity
    post :update_induction
    get :view_induction_list
    get :confirm
    end
  end
  resources :induction_masters
  resources :induction_templates
  resources :root_cause_masters do
    collection do
      get :is_confirm
    end
  end

  resources :goal_ratings do
    collection do
      get :periodwise_goal_set
      post :periodwise_goal_list
      post :set_goal_periodwise
      get :select_dropdown
      get :self_modal
      patch :update_self_modal
      get :appraiser_modal
      patch :update_appraiser_modal
      get :reviewer_modal
      patch :update_reviewer_modal
      get :goal_modal
      patch :update_goal_modal
      get :print_department
      get :show_employee
      post :send_mail_to_appraiser
      get :subordinate_list_goal_wise
      post :print_subordinate_list
      post :all_subordinate_list
      get :performance_type
      get :period_for_training
      get :training_request
      post :create_attribute_training
      post :create_goal_training
      get :period_and_topic_wise_list
      get :period_topic_wise_employee
      post :send_request_for_training
      post :training_plan_create
      get :modal_training_plan
      get :goal_set_modal
      post :update_goal_set_modal
      get :trainee_list
      post :print_employee_detail
      get :all_emp_list
      get :increment_index
      post :all_employee_list
      post :print_employee_list
      get :is_confirm
      get :new_form
      post :create_for_multiple
      get :employee_goal_wise
      post :print_employee
      post :detail_goal_wise
      get :detail_goal_wise
      get :detail_goal_wise_xls
      get :print_goal_wise
      post :print_goal_wise
      get :employee_wise_goal
      post :goal_employee_wise
      post :detail_employee_wise
      get :print_employee_wise
      get :detail_employee_wise_xls
      get :period_rating_wise
      post :Period_rating_wise_employee
      get :Period_rating_wise_employee
      get :period_rating_wise_pdf
      get :period_rating_wise_xls
      get :increment_index_report
      get :detail_employee_wise
      get :show_goal_rating
      get :show_attribute
      get :show_goal_modal
      get :show_attribute_modal
      get :import_xl
      post :import
      get :goal_set
      get :admin_level_goal_set
      get :admin_level_period
      get :admin_appraiser_evaluation_period
      get :admin_level_appraiser_evaluation
      get :admin_reviewer_evaluation_period
      get :admin_level_reviewer_evaluation
    end
  end
  #post 'goal_ratings/update_goal_set_modal'
  resources :goal_bunches do
    collection do
      get :appraisee_detail_list
      get :ajax_upload_document
      post :show_periodwise_employee
      get :goal_approval
      post :appraiser_confirm
      get :appraisee_comment
      post :self_comment_confirm
      get :appraiser_subordinate
      get :appraiser_comment
      post :appraiser_create
      post :appraiser_comment_confirm
      get :subordinate_list
      get :reviewer_comment
      post :reviewer_create
      post :reviewer_comment_confirm
      get :reviewer_subordinate
      get :employee_list
      get :final_comment
      patch :final_create
      get :final_modal
      patch :update_final_modal
      post :final_comment_confirm
      get :final_detail
      get :final_employee_list
      get :print_final_detail
      get :modal_self_overall
      post :self_overall_comment_create
      post :self_overall_comment_confirm
      get :modal_appraiser_overall
      post :appraiser_overall_comment_create
      post :appraiser_overall_comment_confirm
      get :modal_reviewer_overall
      post :reviewer_overall_comment_create
      post :reviewer_overall_comment_confirm
      get :modal_period
      post :modal_period_create
      post :xl_sheet_print
      get :goal_period_list
      get :period_list_appraisee
      get :period_list_appraiser
      get :period_list_reviewer
      get :period_list_final
      get :period_list_print
      get :print_appraisee_detail
      get :print_appraiser_detail
      get :print_reviewer_detail
      get :xl_appraisee_detail
      get :xl_appraiser_detail
      get :xl_reviewer_detail
      get :subordinate_list_for_appraisee
      get :period_appraisee
      get :subordinate_list_for_reviewer
      get :period_reviewer
      get :period_for_appraisee
      post :print_emp_list
      post :all_emp_list
      get :emp_list_goal_wise
      get :goal_bunch_list
      get :set_goal_list
      get :appraisee_detail_for_print
      get :appraiser_detail_for_print
      get :reviewer_detail_for_print
      get :period_for_multiple
      post :create_multiple_bunch
      get :revert_goal
      get :self_evaluation
      get :import_xl
      post :import
      get :self_comment_modal
      post :self_comment
      get :admin_period_set
      post :create_admin_level_period
      get :admin_goal_approval_period
      get :admin_level_goal_approval
      get :admin_self_evaluation_period
      get :admin_level_self_evaluation
      get :appraiser_comment_modal
      get :appraiser_evaluation
      get :import_appraiser_evaluation_xl
      post :import_appraiser
      get :reviewer_evaluation
      get :import_reviewer_evaluation_xl
      post :import_reviewer
      get :reviewer_comment_modal
    end
  end
  resources :goal_perspectives do
    collection do
      get :is_confirm
      get :modal
      get :goal_perspective_master
      post :goal_perspective_master
      get :import_xl
      post :import
    end
  end
  resources :ratings do
    collection do
      get :is_confirm
      get :rating_master
      post :rating_master
      get :import_xl
      post :import
    end
  end
  resources :periods do
    collection do
      get :is_confirm
      get :period_master
      post :period_master
      get :import_xl
      post :import
    end
  end
  resources :overall_ratings do
    collection do
      get :modal_self
      patch :update_modal_self
    end
  end

  resources :overall_ratings do
    collection do
      get :modal_self
      patch :update_modal_self
    end
  end

  resources :exit_interviews  do
    collection do
      post :print_exit_interview
    end
  end

  resources :about_companies do
    collection do
      get :is_confirm
      get :about_company_master
      post :about_company_master
      get :import_xl
      post :import
    end
  end
  resources :about_bosses do
    collection do
      get :is_confirm
      get :about_boss_master
      post :about_boss_master
      get :import_xl
      post :import
    end
  end
  resources :question_masters do
    collection do
      get :is_confirm
      get :question_master
      post :question_master
      get :import_xl
      post :import
    end
  end
  resources :training_records
  resources :leaving_reasons do
    collection do
      get :is_confirm
      get :leaving_reason_master
      post :leaving_reason_master
      get :import_xl
      post :import
    end
  end
  resources :training_approvals
  resources :training_topics
  resources :employee_promotions do
    collection do
      get :collect_data
      get :promotion_history
      get :employee_list
      get :print_promotion_excel
      get :print_employee_promotion
      get :display_certificate
      get :print_certificate
      get :modal_promotion
    end
  end
  resources :accident_masters
  resources :travel_expence_types do
    collection do
      get :is_confirm
      get :travel_expence_type_master
      post :travel_expence_type_master
    end
  end
  resources :travel_modes do
    collection do
      get :is_confirm
      get :travel_mode_master
      post :travel_mode_master
    end
  end
  resources :interview_analyses do
    collection do
      post :print_interview_analysis_list
      get :confirm_interview_analysis
    end
  end
  resources :interview_decisions do
    collection do
      get :is_confirm
      get :interview_decision_master
      post :interview_decision_master
      get :import_xl
      post :import
    end
  end
  resources :interview_attributes do
    collection do
      get :is_confirm
      get :interview_attribute_master
      post :interview_attribute_master
      get :import_xl
      post :import
    end
  end
  resources :interview_evalutions do
    collection do
      get :is_confirm
      get :interview_evalution_master
      post :interview_evalution_master
      get :import_xl
      post :import
    end
  end
  resources :training_topic_masters do
    collection do
      get :is_confirm
      get :training_topic_master
      post :training_topic_master
      get :import_xl
      post :import
    end
  end

  resources :employee_resignations do
    collection do
      get :exit_interview_employee_list
      get :exit_interview
      get :employee_resignation_list
      get :resignation_history
      get :employee_resignation_confirmation
      get :approve_resignation
      get :reject_employee_resignation
      post :send_request_to_higher_authority
      get :modal
      get :cancel_resignation_request
      get :edit_n_send_next_modal
      post :edit_n_send
      get :emp_resignation_history
      get :show_resignation_detail
      get :print_resignation_detail
      get :xl_resignation_detail
      post :edit_n_approve
      get :edit_n_approve_modal
      get :display_notice_period
      post :first_approve
      get :first_approve
      get :second_approve
      get :final_approval_emp_resignation_list
      get :final_approve
      get :first_reject
      get :first_approve_modal
      get :second_reject
      get :final_reject
      get :first_approve_modal
      get :all_employee_resignation_list
      get :modal_show_resignation_status_detail
      get :show_resignation_detail
      get :final_approved_list
      get :confirm_resignation
      get :cancel_resignation_list
      get :modal_resignation_detail
      get :final_approve_modal
      get :list_for_settelment
      get :settelment_date
      post :settelment_date_create
      post :update_dates
      post :first_approve_update_dates
      get :collect_date
  end
end

  resources :travel_options do
    collection do
      get :is_confirm
      get :travel_option_master
      post :travel_option_master
    end
  end
  resources :training_plans  do
    collection do
      post :create_records
      post :training_plan_create
      get :print_training_details
      get :trainee_list
      get :modal_feedback
      post :update_feedback
      get :training_details_list
      get :training_topic_wise_search
      get :show_traineerequest_list
      get :trainee_request_list
      post :confirm_employee_for_training
    end
  end
  resources :training_requests do
    collection do
      get :training_request_list
      get :training_request_confirmation
      # post :approve_training_request
      get :reject_training_request
      get :confirmation_list
      get :modal_approver_comment
      get :modal_reject_comment
      get :department_wise_search
      get :show_dept_wise_form
      get :_employee_list
      patch :create_dept_wise_request
      post :comment
      post :create_department_wise_training_request
      get :approve_training_request
      get :modal_approve_and_send_next
      get :first_approve
      get :approve_and_send_next
      get :final_approval_training_list
      get :final_approve
      post :selected_employee_training_list
      get :training_request_form
      post :training_create_form
      # post :training_request_form
    end
  end
  resources :selected_resumes  do
    collection do
    post :is_confirm
    get :new1
    get :all_resume_list
    post :create_new
    get :modal
    post :offer_letter
    get :modal_change_status
    post :update_status
    get :modal_profile_update
    post :update_profile
    get :part_resume
    post :is_confirm_resume
    get :modal_vacancy_dropdown
    post :update_vacancy
    get :show_selected_resume
    get :show_part_resume
    get :refferal
    post :refferal_create
    get :modal_show_selected_resume
    get :modal_vacancy_master
    get :internal
    post :internal_create
    end
  end
  resources :assigned_assets do
    collection do
    post :update_asset
    get :modal
    get :update_asset
    get :import_xl
    post :import
    get :asset_modal
    get :import_asset
    post :assigned_asset_report
    end
  end
  resources :asset_types do
    collection do
      get :is_confirm
      get :asset_type_master
      post :asset_type_master
      get :import_xl
      post :import

    end
  end
  resources :employee_nominations do
    collection do
      get :import_xl
      post :import
    end
  end
  resources :nomination_masters do
    collection do
      get :is_confirm
      get :nomination_master
      post :nomination_master
    end
  end
  resources :relation_masters do
    collection do
      get :is_confirm
      get :relation_master
      post :relation_master
      get :import_xl
      post :import
    end
  end
  resources :particular_vacancy_requests
  resources :travel_expences
  resources :daily_bill_details do
    collection do
    # post :is_confirm
    get :all_expence_request
    get :modal_expense_edit
    post :update_expence
    get :select_form
    get :is_confirm
    get :print_daily_bill
    get :daily_bill_history
    get :daily_bill_request_confirmation
    get :approve_request
    get :approved_daily_bill_details
    get :travel_request_list
    get :comment_modal
    post :update_comment
    get :reject_request
    post :approve_and_send_next
    get :approve_and_send_next_modal
    post :approve_n_send_next
    get :travel_request_history_list
    get :image_modal
    post :print_expence_date_report
    get :print_expence_date_report
    get :expence_date_report_list
    get :expence_date_report
    get :modal_expense_claim_list
    get :modal_travel_request_process
    end
  end
  resources :travel_requests do
    collection do
      get :all_travel_request
      get :show_travel_process
      get :show_request_modal
      get :daily_bill
      get :travel_history
      get :travel_request_confirmation
      get :approve
      get :reject
      post :send_request_to_higher_authority
      get :modal
      get :cancel_travel_request
      get :travel_request_list
      get :edit_and_send_next_modal
      post :edit_and_send_next_modal_submit
      get :edit_and_approve_modal
      post :edit_and_approve_modal_submit
      get :is_confirm
      get :application_date_report
      post :print_application_report
      get :print_application_report
      get :travelling_datewise_report
      post :print_travelling_datewise_report
      get :print_travelling_datewise_report
      get :travel_request_id_report
      get :print_travel_request_id_report
      post :print_travel_request_id_report
      get :travel_request_employee_name_report
      get :print_travel_request_employee_name_report
      post :print_travel_request_employee_name_report
      get :first_approve
      get :approve_and_send_next
      get :final_approve
      get :final_approval_travel_list
    end
  end


  namespace :reports do
    get 'monthly_expences_details/new'

    get 'society_membership_details/new'
    post 'society_membership_details/society_membership_report'

    get 'overtime_salary_details/daily'
    post 'overtime_salary_details/overtime_daily_detail_report'

    get 'food_deduction_details/new'
    get 'food_deduction_details/food_deduction_report'
    post 'food_deduction_details/dynamic_report'
    post 'food_deduction_details/food_deduction_detail_report'

    get 'ctc_details/new'
    post 'ctc_details/ctc_detail_report'

    get 'overtime_salary_details/new'
    post 'overtime_salary_details/overtime_montly_detail_report'

    get 'professional_tax_details/new'
    post 'professional_tax_details/professional_tax_detail_report'

    get 'retention_money_details/new'
    post 'retention_money_details/retention_money_report'

    get 'welfare_details/new'
    post 'welfare_details/welfare_detail_report'

    get 'esic_details/new'
    post 'esic_details/esic_detail_report'

    get 'pf_details/new'
    post 'pf_details/pf_detail_report'

    get 'instalment_details/new'
    post 'instalment_details/instalment_detail_report'

    get 'advance_salaries/new'
    post 'advance_salaries/advance_salary_report'

    get 'physical_details/new'
    post 'physical_details/physical_detail_report'

    get 'joining_details/new'
    get 'joining_details/collect_departments'

    get 'basic_details/new'
    get 'basic_details/employee_basic_info'
    get 'basic_details/collect_departments'
    get 'basic_details/employee_list'
    get 'basic_details/select_department'
    post 'basic_details/list_of_employee'
    get 'basic_details/show_basic_detail'
    post 'basic_details/show_basic_detail'
    get 'basic_details/employee_contact_list'
    get 'basic_details/employee_contact_report'
    # post 'basic_details/employee_contact_report_pdf'
     get 'basic_details/employee_contact_report_pdf'

    get 'salaries/new'
    post 'salaries/date_range_report'
    get 'salaries/download'

    post 'salaries/ctc_yearly_report'
    get 'salaries/ctc_yearly'



  #   get 'certificate/new'
  #   post 'certificate/certificate_print'
  end

  namespace :views do

    get 'goal_bunches/final_detail'
    post 'goal_bunches/xl_sheet_print'

    get 'pdf_salaries/excel_report'
    post 'pdf_salaries/print_salary_slip_excel'

    get 'employee_promotions/promotion_history'
    post 'employee_promotions/print_promotion_excel'

  end

  resources :employee_leav_request_reports, only: [:index]

  resources :capture_resumes do
    collection do
      get :download_resume_page
    end
  end

  resources :interview_schedules do
    collection do
      get :search_by_interview_date
      get :modal
      get :interview_reschedule
      post :send_email_to_candidate
      get :sample_email
      post :is_confirm
      get :new1
      get :edit1
      get :interview_reschedule_list
      get :interviewee_list
      get :resume_list
      post :create_new
      post :print_interviewee_list
      get :all_interview_schedule_list
      get :final_report
      post :print_final_report
      get :interview_round_list
      get :modal_schedule_list
      post :update_interview_schedule
      patch :create_new
      get :show_interview_round_list
      get :modal_show_page
    end
  end
  resources :vacancy_masters do
    collection do
      get :search_by_vacancy_post_date
      get :vacancy_request_confirmation
      get :vacancy_history
      post :import
      get :modal
      post :send_request_to_higher_authority
      get :reject_vacancy
      get :approve_vacancy
      get :approve_vacancy_list
      get :cancel_vacancy_request
      get :particular_vacancy_request_list
      get :approved_vacancy_list
      get :modal1
      post :update_no_of_positions
      get :is_closed
      get :vacancy_resume
      get :modal2
      post :confirm_candidate
      get :modal3
      post :update_vacancy_details
      get :vacancy_history_resume
      get :approved_vacancy_request_history_list
      get :particular_vacancy_request_list_history
      get :gen_xml
      get :vacancy_profile
      get :vacancy_history_list
      get :show_vacancy_request_history
      get :reporting_masters_vacancy_master_list
      post :import
      get :first_approve
      get :approve_and_send_next
      get :final_approval_vacancy_list
      get :final_approve
      get :vac_history
      get :current_employee_vacancy_list
      get :confirm_interview_schedule_list
      get :confirm_vacancy
      get :confirm_candidate_1
      get :vacancy_shortlisted_list
      get :shortlisted_resume
      get :vacancy_hr_resume
      get :hr_resume
      post :shortlist_for_interview
      get :show_selected_resume
      get :show_scheduled_resume
      get :show_vacancy_resume
      get :show_vacancy_hr_resume
      get :show_vacancy_shortlisted_list
      get :show_vacancy_profile
      get :show_refferal
      get :show_internal
      get :refferal
      get :internal
      get :modal_show_vacancy_page
      get :select_reason
      get :select_notice_period
      get :select_relocation
    end
  end
   resources :leave_c_offs do
    collection do
      get :search_by_c_off_date
      get :add_coff
      get :destroy_self
      get :approve_c_off
      post :approve_c_off
      get :reject_c_off
      get :approve_modal
      get :final_approve
      get :final_reject
      get :admin_c_off_approval
      get :admin_level_c_off_detail
      get :admin_approve_modal
      get :modal
      get :detail_modal
      get :modal_c_off
      get :maintenance_report
      get :import_xl
      post :import
    end
  end

  resources :self_services do
    collection do
      get :self_exit_interview_list
      get :employee
      get :employee_template
      get :salaryslip
      get :advance
      get :attendance
      get :employee_resignation
      get :resignation_history
      get :modal_show_resignation_detail
      get :employee_transfer
      get :travel_request
      get :employee_attendance
      post :show_self_datewise_attendance
      get :datewise_attendance_report_xls
      get :datewise_attendance_report_pdf
      get :show
      get :investment_declaration
      post :create_self_declaration
      get :leave_c_off
      post :create_self_c_off
      get :reimbursement_request
      post :create_reimbursement_request
      get :employee_rembursment
      post :create_emp_rembursment
      get :add_attendance
      post :create_self_attendance
      get :show_investment_declaration_list
      get :show_leave_c_off_list
      get :modal
      get :holiday_setup
      post :create_self_resignation
      get :internal
      get :show_internal_modal
      get :employee_contact_library
      get :modal_contact_library
      get :modal_c_off
      get :create_in_time
      get :create_out_time
      get :display_notice_period
      get :exit_interview
      get :present_to_title
      get :modal_info_about_attendance
    end
  end

    resources :import_files do
    collection do
      get :company_type_import
      post :import_company_type
      post :import_department_type
      post :import_bank
      post :import_policy_type
      post :import_employee_code_master
      post :import_employee_type
      post :import_nationality
      post :import_religion
      post :import_relation
      post :import_blood
      post :import_illness
      post :import_employee_grade
      post :import_employee_category
      post :import_designation
      post :import_asset_type
      post :import_checklist
      post :import_qualification
      post :import_qualification_level
      post :import_specialization
      post :import_univercity
      post :import_year
      post :import_period
      post :import_rating
      post :import_goal
      post :import_attribute
      post :import_activity
      post :import_calender
      post :import_skillset
      post :import_evaluation
      post :import_criteria
      post :import_interview_type
      post :import_target_company
      post :import_question_master
      post :import_about_company
      post :import_about_manager
      post :import_leaving_reason
      post :import_training_course
      post :import_reward_type
      post :import_reward_owner
      post :import_root_cause_master
      post :import_project_master
      post :import_rembursment_master
    end
  end

  resources :accident_records do
    collection do
      get :collect_esic
    end
  end

  resources :employee_attributes do
    collection do
      get :appraisee
      post :appraisee_create
      get :appraiser
      post :appraiser_create
      post :is_confirm
      get :show_list
      get :single_attribute
      post :create_attribute
      post :is_confirm_all
    end
  end
  resources :employee_goals do
    collection do
      get :subordinate_list
      post :is_confirm
      get :employee_list
      get :show_goal
      get :send_email_to_employee
      get :show_employee
      post :print_detail
      get :select_designation
      get :single_goal
      post :create_goal
      post :is_confirm_all
      get :appraiser1_approval
      get :appraiser1_subordinate
    end
  end

  resources :definitions
  resources :particular_leave_records do
    collection do
      get :show_leave_record
      get :search_by_leave_date
      get :leave_approval_report
      post :show_approved_record
      get :show_approved_record
    end
  end

  match 'goal_ratings/:id/download_self_document/:id' => 'goal_ratings#download_self_document', :via => [:get], :as => :download_self_document
  match 'selected_resumes/:id/download_resume/:id' => 'selected_resumes#download_resume', :via => [:get], :as => :download_resume
  match 'selected_resumes/:id/download_image/:id' => 'selected_resumes#download_image', :via => [:get], :as => :download_image
  match 'accident_records/:id/download_jpg/:id' => 'accident_records#download_jpg', :via => [:get], :as => :download_jpg
  match 'induction_activities/:id/download_document/:id' => 'induction_activities#download_document', :via => [:get], :as => :download_document
  match 'induction_masters/:id/download_induction_document/:id' => 'induction_masters#download_induction_document', :via => [:get], :as => :download_induction_document

  match 'capture_resumes/:id/download/:id' => 'capture_resumes#download', :via => [:get], :as => :download
  match 'capture_resumes/:id/download_photo/:id' => 'capture_resumes#download_photo', :via => [:get], :as => :download_photo
  match 'interview_schedules/:id/send_email_to_candidate/:id' => 'interview_schedules#send_email_to_candidate', :via => [:get], :as => :send_email_to_candidate
  match 'interview_schedules/:id/sample_email_to_interviewer/:id' => 'interview_schedules#sample_email_to_interviewer', :via => [:get], :as => :sample_email_to_interviewer

  match 'circulars/:id/download_documents/:id' => 'circulars#download_documents', :via => [:get], :as => :download_documents
  match 'circulars/:id/download_company_policy_document/:id' => 'circulars#download_company_policy_document', :via => [:get], :as => :download_company_policy_document

  match 'daily_bill_details/:id/download_doc/:id' => 'daily_bill_details#download_doc', :via => [:get], :as => :download_doc
  match 'daily_bill_details/:id/download_pics/:id' => 'daily_bill_details#download_pics', :via => [:get], :as => :download_pics
  match 'company_policies/:id/download_docs/:id' => 'company_policies#download_docs', :via => [:get], :as => :download_docs
  match 'employee_documents/:id/download_emp/:id' => 'employee_documents#download_emp', :via => [:get], :as => :download_emp
  match 'employee_documents/:id/download_pic/:id' => 'employee_documents#download_pic', :via => [:get], :as => :download_pic
  match 'investment_declarations/:id/investment_document/:id' => 'investment_declarations#investment_document', :via => [:get], :as => :investment_document

  match 'self_services/:id/investment_document2/:id' => 'self_services#investment_document2', :via => [:get], :as => :investment_document2
 
  match 'due_templates/:id/download_due_tempalte_documents/:id' => 'due_templates#download_due_tempalte_documents', :via => [:get], :as => :download_due_tempalte_documents

  match 'issue_requests/:id/download_screenshot_image/:id' => 'issue_requests#download_screenshot_image', :via => [:get], :as => :download_screenshot_image
  match 'issue_requests/:id/download_screenshot/:id' => 'issue_requests#download_screenshot', :via => [:get], :as => :download_screenshot
  match 'companies/:id/download_company_logo/:id' => 'companies#download_company_logo', :via => [:get], :as => :download_company_logo
  
  match 'candidate_forms/:id/document_1/:id' => 'candidate_forms#document_1', :via => [:get], :as => :document_1
  match 'candidate_forms/:id/document_2/:id' => 'candidate_forms#document_2', :via => [:get], :as => :document_2

  match 'visitor_details/:id/download_person_image/:id' => 'visitor_details#download_person_image', :via => [:get], :as => :download_person_image

  match 'employees/:id/download_employee_signature/:id' => 'employees#download_employee_signature', :via => [:get], :as => :download_employee_signature
  match 'employees/:id/download_employee_profile_picture/:id' => 'employees#download_employee_profile_picture', :via => [:get], :as => :download_employee_profile_picture

  match 'investment_declarations/:id/investment_download_document/:id' => 'investment_declarations#investment_download_document', :via => [:get], :as => :investment_download_document

  # get '/screenshot', to: 'issue_requests#download_screenshot', as: 'download_screenshot'
  # get '/download', to: 'issue_requests#download_screenshot_image', as: 'download_screenshot_image'

  resources :leave_c_offs do
    collection do
      post :create_self_c_off
    end
  end

  resources :overtime_month_records

  resources :overtime_daily_records do
    collection do
      get :employees
    end
  end

  resources :bonus_employees do
    collection do
      get :search_bonus
      get :collect_bonus
      get :particular_employee_bonus
      get :bonus_employee_xls
      get :bonus_employee_pdf
      get :particular_bonus_employee_xls
      get :particular_bonus_employee_pdf
      get :bonus_employee_report
      post :dynamic_report
    end
  end
  resources :bonus_masters do
    collection do
      get :is_confirm
    end
  end
  resources :overtime_salaries do
    collection do
      get :collect_basic
      get :overtimes
      get :select_month_year_form
      get :collect_employee
      post :create_overtime_salary
      get :revert_overtime
      get :show_employee
      post :destroy_overtime_salary
    end
  end
  resources :overtime_masters do
    collection do
      get :is_confirm
    end
  end
  resources :reserved_categories do
    collection do
      get :is_confirm
      get :reserved_category_master
      post :reserved_category_master
    end
  end
  resources :pf_masters do
    collection do
      get :is_confirm
      get :modal
    end
  end

  resources :society_member_ships do
    collection do
      get :is_confirm
    end
  end
  resources :well_faires do
    collection do
      get :is_confirm
      get :modal
    end
  end
  resources :monthly_expences do
    collection do
      get :employees
      get :employee_expences
      get :monthly_expence_report
      get :dynamic_report
      post :dynamic_report
      get :modal
      get :import_monthly_expence
      post :import
      get :delete_monthly_expence
      get :edit_monthly_expence
    end
  end
  resources :expencess_types do
    collection do
      get :is_confirm
      get :expence_type_master
      post :expence_type_master
    end
  end
  resources :food_coupan_masters do
    collection do
      get :is_confirm
      get :food_coupan_master
      post :food_coupan_master
    end
  end
  resources :food_deductions do
    collection do
      get :calculate_food_deduction_amount
      get :employees
      get :display_food_deduction
      get :food_deduction_xls
      get :food_deduction_pdf
      get :food_deduction_report
      get :dynamic_report
      post :dynamic_report
      get :modal
      get :import_food_deduction
      get :import_deduction
      post :import_deduction
    end
  end
  resources :reporting_masters do
    collection do
      get :update_reporting_manager
      post :update_manager
      get :show_employee
    end
  end
  resources :leave_status_records do
    collection do
      get :cancel_after_approve
    end
    member do
      get :cancel
      get :first_approve
      get :second_approve
      get :first_reject
      get :second_reject
      get :admin_first_approve
      get :admin_second_approve
      get :admin_first_reject
      get :admin_second_reject
    end
  end
  resources :advance_types do
    collection do
      get :is_confirm
      get :advance_type_master
      post :advance_type_master
    end
  end
  resources :employee_templates do
    member do
      get :deactivate
    end
    collection do
      post :activate
      get :template_list
      get :fresh_template
      get :fresh
      get :assign_new_template
      post :create_fresh_template
      get :revert_salary_template
      get :template_salary
      get :cancel_salary_template
      get :active_list
      post :show_employee_record
      get :salary_breakup_pdf
      get :salary_breakup_xls
      get :employee_wise_breakup
      post :salary_employee_wise
      get :employee_wise_pdf
      get :employee_wise_xls
      get :employee_record
      get :import_xl
      post :import
    end
  end
  resources :retention_moneys do
    collection do
      get :select_form
      get :is_confirm
      get :modal
    end
  end

  resources :payment_modes do
    collection do
      get :is_confirm
      get :payment_mode_master
      post :payment_mode_master
    end
  end
  resources :excel_exports do
    collection do
      get :payroll
    end
  end
  resources :esic_masters do
    collection do
      get :is_confirm
      get :modal
    end
  end
  resources :excel_uploads do
    collection do
      post :load_excel
    end
  end
  resources :employee_categories do
    collection do
      get :is_confirm
      get :employee_category_master
      post :employee_category_master
      get :import_xl
      post :import
    end
  end
  resources :other_salary_components do
    collection do
      get :is_confirm
    end
  end
  resources :salaryslip_components do
    collection do
      post :xml_print
      post :index
    end
  end
  resources :salaryslips do
    collection do
      post :save_data
      get :employee_salary_list
      get :show_salaryslip
      get :salary_slip_list
      get :select_month_year_form
      get :show_unsaved_employee
      post :save_all_data
      get :salary_bubble_form
      patch :update_cell
      get :print_salary_slip
      get :print_multiple_salary_slip
      get :revert_salary
      get :show_employee
      post :destroy_salary_slip
      get :salary_slip_report
      get :salary_report
      get :display_salaryslip_report
      post :pdf_report
      get :salaryslip_xls
      get :emp_contibution_salary_list
      get :emp_contribution_slip_list
      get :show_emp_contribution_salaryslip
      get :print_emp_contribution_slip
      get :salary_slip_report_form
      post :dynamic_report
      get :salary_slip_xls
      get :salary_slip_pdf
      get :salaryslip_daterange_report
      post :dynamic_daterange_report
      get :daterangewise_salaryslip_xls
      get :confirm_salaryslip
      get :show_unconfirmed_employee
      post :Confirm_salaryslip
      get :show_salaryslip_rg
      get :show_month_salaryslip_rg
      get :print_salary_slip_rg
      get :show_salaryslip_formate_3
      get :print_salary_slip_formate_3
      get :search_by_slip_detail
      get :leave_detail
      get :leave_detail_xls
      get :import_xl
      post :import
      get :statutory_computation
      get :statutory_computation_report
      post :statutory_computation_report
      get :pf_computation
      get :pf_computation_report
      post :pf_computation_report
      get :provident_fund
      get :provident_fund_report
      post :provident_fund_report
      get :pf_monthly_statement
      get :pf_monthly_statement_report
      post :pf_monthly_statement_report
      get :form_3A
      get :form_3A_report
      post :form_3A_report
      get :form_6A
      get :form_6A_report
      post :form_6A_report
      get :form_12A
      get :form_12A_report
      post :form_12A_report
      get :dynamic_daterange_report
      post :dynamic_daterange_report
      get :form_16A
      get :form_16A_report
      post :form_16A_report
    end
  end

  resources :pdf_salaries do
    collection do
      get :employee_list_pdf
      get :select_month_year_form
      get :show_employee
      post :print_salary_slip_monthwise
      get :salary_slip_costunit_wise
      get :show_employee_costunit_wise
      post :print_salary_slip_cost_unitwise
      get :excel_report
      post :print_salary_slip_excel
      get :dynamic_dropdown
      post :salary_slip_company_location_department
      get :curent_salary_template
      get :current_employee_salary_template
    end
   end

  resources :salary_slip_ledgers do
    collection do
      get :yearly_reports
      get :month_wise_yearly_report
      post :month_wise_yearly_report
      get :select_month_year_form
      get :show_employee
      get :employee_ctc
      get :employee_monthly_ctc
      post :show_employee_ctc
      get :employee_salary_ledger
      post :print_salary_slip_monthwise
      get :cost_unit_wise
      get :cost_unit_wise_salary
      get :salary_report
      get :bank_wise_net_amount
      get :collect_salary
      get :salary_ledger
      get :all_employee_salary_ledger
      get :date_wise_ledger
      post :date_wise_ledger
      post :show_monthly_ctc
      get :pf_detail_report
      get :dynamic_report
      post :dynamic_report
      get :pf_detail_pdf
      get :select_bank_wise
      get :show_employee_list
      get :esic_report
      get :esic_dynamic_report
      post :esic_dynamic_report
      # post :dynamic_report
      # get :pf_detail_pdf
      post :print_xls
      get :proff_tax_xls
      get :proff_tax_pdf
      get :proff_tax_report
      get :professional_tax_master_dynamic_report
      post :professional_tax_master_dynamic_report
      get :retention_money_report
      get :retention_dynamic_report
      post :retention_dynamic_report
      get :welfare_detail_report
      get :wellfair_dynamic_report
      post :wellfair_dynamic_report
      get :soc_membership_report
      get :soc_membership_dynamic_report
      post :soc_membership_dynamic_report
      get :monthly_deduction_report
      post :monthly_deduction
      get :monthly_deduction
      get :export_pf_report_to_text
    end
  end

  resources :instalments do
    collection do
      get :employees
      get :display_installment
      get :instalment_xls
      get :installment_pdf
      get :installment_report
      post :dynamic_report
      get :dynamic_report
    end
  end
  resources :advance_salaries do
    collection do
      get :search_by_advance_date
      get :advances
      get :advance_salary_report
      post :dynamic_report
      get :dynamic_report
      get :advance_report
      get :show_employee_detail
      get :advance_detailed_report
      post :advance_detail
      get :advance_detail
      get :yearly_advance_report
      post :yearly_advance
      get :yearly_advance
    end
  end

  resources :workingdays do
    collection do
      get :employees
      get :search_month_year
      get :generate_workingday
      get :workingdays_detail
      post :print_working_day
      post :create_working_day
      get :search_month_year_xls
      get :generate_workingday_xls
      post :is_confirm_workingday
      get :display_workingday
      post :display_workingday
      get :workingday_xls
      get :workingday_pdf
      get :import_workingday
      post :import
      get :revert_workingday
      get :show_employee
      post :revert_all_workingday
      get :search_by_month_year
      post :month_year_wise_record
      get :date_report
      post :print_date_report
      get :print_date_report
      get :revert_workingday_datewise
      get :show_employee_datewise
      post :revert_workingday
      get :datewise_workingday
      post :show_datewise_workingday
      get :show_datewise_workingday
      get :import_working_day

      # post :import_working_day

      post :import_day
      get :datewise_total_workingday
      post :show_total_workingday
      get :show_total_workingday
    end
  end

  resources :shift_rotations do
    collection do
      get :collect_employee
    end
  end

  resources :employee_monthly_days do
    collection do
      get :find_employee_for_employee_monthly_day
    end
  end

  resources :holidays do
    collection do
      post :assign_to_employee
      post :employee_list
      get :modal
      get :show_employee_list
    end
  end

  resources :employee_salary_templates do
    collection do
      get :find_employee_for_assign_template
      get :find_template
      post :create_employee_template
      get :show_employee_list
      get :show_employee_salary_template
      get :show_employee_salary_slip
      get :modal
      get :salary_template
      get :find_employee_for_salary
      post :save_data
      post :is_confirm_employee_template
      get :current_template
      get :employee_list
      post :show_current_template
      get :employees_current_template
    end
  end

  resources :salary_component_templates do
    collection do
      get :salary_template_page
    end
  end
  resources :salary_templates do
    collection do
      get :is_confirm
    end
  end
  resources :religions do
    collection do
      get :is_confirm
      get :religion_master
      post :religion_master
      get :import_xl
      post :import
    end
  end
  resources :banks do
    collection do
      get :is_confirm
      get :bank_master
      post :bank_master
      get :import_xl
      post :import
    end
  end
  # resources :employee_annual_salaries do
  #   collection do
  #     get :created_employee_annual_salary
  #     get :employee_annual_salary_slip
  #     get :all_employee_monthly_salary
  #   end
  # end
  resources :salary_components do
    collection do
      post :create_employee_template
      get :is_confirm
      get :modal
      get :salary_component_list
      get :import_xl
      post :import
    end
  end
  resources :universities do
    collection do
      get :is_confirm
      get :university_master
      post :university_master
      get :import_xl
      post :import
    end
  end
  resources :degree_streams do
    collection do
      get :is_confirm
      get :specialization_master
      post :specialization_master
      get :import_xl
      post :import
    end
  end
  resources :degree_types do
    collection do
      get :is_confirm
      get :qualification_level_master
      post :qualification_level_master
      get :import_xl
      post :import
    end
  end
  resources :districts do
    collection do
      get :district_master
    end
  end
  resources :states do
    collection do
      get :state_master
    end
  end
  resources :countries
  resources :employee_designations do
    collection do
      get :is_confirm
      get :employee_designation_list
      get :employee_designation_master
      post :employee_designation_master
      get :import_xl
      post :import
    end
  end
  resources :cost_centers do
    collection do
      get :is_confirm
    end
  end
  resources :degrees do
    collection do
      get :is_confirm
      get :print_qualification
      post :print_qualification
      get :import_xl
      post :import
    end
  end
  resources :universities
  resources :degree_streams
  resources :degree_types do
    collection do
      get :qualification_level_master
      post :qualification_level_master
      get :import_xl
      post :import
  end
end
  resources :districts do
    collection do
      get :list_district
    end
    end
  resources :states do
    collection do
      get :list_state
    end
    end

  resources :countries do
    collection do
      get :list_country
    end
    end
  resources :employee_designations
  resources :cost_centers
  resources :degrees
  resources :attendances do
    collection do
      get :attendance_details
      get :collect_shift_date
      get :collect_employee
      get :search_by_date
    end
  end
  resources :employee_shifts do
    collection do
      get :employee_of_shift
      get :shift_date
      get :shift_rotation
      get :find_employee_for_assign_shift_rotation
      get :employee_shift_list
    end
  end
  resources :company_shifts
  resources :roles do
    collection do
      get :dynamic_form
      get :role_edit_list
      get :is_confirm
      get :role_master
      post :role_master
    end

    member do
      get :edit_role
      patch :update_role
    end
  end
  resources :employee_bank_details do
    collection do
      post :import
      get :import_xl
      get :import_bank_detail
      post :bank_detail_report
    end
  end

  resources :leav_cancelleds

  resources :employee_leav_balances do
    collection do
      get :collect_employee_for_leave
      get :employee_leave_balance
      get :leave_balance_modal
      patch :update_leave_balance
      get :is_confirm_leave
      patch :update_leave_auto
      get :modal_balance_detail
      get :leave_balance
      # post :leave_balance
      get :leave
      post :leave
      get :import_xl
      post :import
      get :basic_report
      post :report
      get :report
      get :date_categorywise_balance
      post :show_date_categorywise
      get :show_date_categorywise
      get :import_employee_leav_balance
      post :employee_leav_balance_report
    end
  end

  resources :leav_rejecteds
  resources :leav_approveds
  resources :employee_leav_requests do
    collection do
      get :approved_or_rejected_leave_request
      get :employee_list
      get :from_hr
      get :hr_view_request
      get :employee_history_with_current_leave
      get :search_by_start_date
      get :search_by_end_date
      get :search_by_is_pending_date
      get :employee_leav_request_reports
      get :all_leave_request_list
      get :admin_employee_history_with_current_leave
      get :select_checkbox
      get :leave_request_report
      post :request_report
      get :request_report
      get :leave_req_status_report
      post :status_wise_request
      get :status_wise_request
      get :select_form
      get :select_admin_form
      get :admin_c_off_form
      get :balancewise_report
      post :show_balancewise_report
      get :show_balancewise_report
      get :leave_request_modal
      get :c_off_date
      get :c_off_date_admin
    end
  end
  resources :company_leavs
  resources :leav_categories do
    collection do
      get :is_confirm
      get :show_leave_category
      get :leave_category_modal
    end
  end
  resources :employee_physicals do
    collection do
      get :import_xl
      post :import
      get :import_physical
      post :physical_detail_report
       end
  end
  resources :joining_details do
    collection do
      get :show_contract
      get :search_by_joining_date
      get :import_xl
      post :import
      get :certificate
      post :certificate_print
      get :certificate_print
      get :joining_certificate
      get :offer_letter_prin
      get :import_joining_detail
      post :joining_detail_report
    end
  end
  resources :employee_grades do
    collection do
      get :is_confirm
      get :employee_grade_master
      post :employee_grade_master
      get :import_xl
      post :import
    end
  end
  resources :awards do
    collection do
      get :add_award_field
      get :import_xl
      post :import
      get :award_modal
      get :import_award
      post :award_detail_report
    end
  end
  resources :skillsets  do
    collection do
      get :import_xl
      post :import
      get :import_skillset
      post :skillset_detail_report
    end
  end
  resources :experiences  do
    collection do
      get :import_xl
      post :import
      get :modal_experience
      post :update_experience
      get :exp_modal
      get :import_experience
      post :experience_detail_report
    end
  end
  resources :certifications do
    collection do
      get :import_xl
      post :import
      get :certificate_modal
      get :import_certification
      post :certification_detail_report
    end
  end
  resources :qualifications do
    collection do
      get :import_xl
      post :import
      get :modal
      post :update_qualification
      get :qualification_modal 
      get :import_qualification
      post :qualification_detail_report
     end
   end
  resources :families do
    collection do
      get :ajax_show_handicap_type_textbox
      get :ajax_show_passport_detail_textbox
      get :import_xl
      post :import
      get :collect_age
      get :family_modal
      get :import_family
      post :family_detail_report
    end
  end
  resources :employees do
    collection do
      get :personal_detail
      get :print_employee_data_formate
      get :employee_list_report
      post :selected_employee_list_report
      get :selected_employee_pdf
      get :selected_employee_xls
      get :selected_on_boarding_pdf
      get :selected_on_boarding_xls
      get :selected_bank_pdf
      get :selected_bank_xls
      get :selected_qualification_pdf
      get :selected_qualification_xls
      get :selected_experience_pdf
      get :selected_experience_xls
      get :selected_skillset_pdf
      get :selected_skillset_xls
      get :selected_certification_pdf
      get :selected_certification_xls
      get :selected_award_pdf
      get :selected_award_xls
      get :selected_employee_physical_pdf
      get :selected_employee_physical_xls
      get :selected_employee_family_pdf
      get :selected_employee_family_xls
      get :selected_employee_nomination_pdf
      get :selected_employee_nomination_xls
      get :selected_asset_pdf
      get :selected_asset_xls
      get :import_xl
      post :import
      get :import_assign_role
      post :import_create_new_user
      get :graph
      get :assign_role
      post :submit_form
      get :basic_detail
      get :ajax_joining_detail
      get :ajax_bank_detail
      get :ajax_qualification_detail
      get :ajax_new_qualification
      get :ajax_experience_detail
      get :ajax_new_experience
      get :ajax_skillset_detail
      get :ajax_new_skillset
      get :ajax_certification_detail
      get :ajax_new_certification
      get :ajax_award_detail
      get :ajax_new_award
      get :ajax_physical_detail
      get :ajax_family_detail
      get :ajax_new_family
      get :ajax_show_textbox
      get :ajax_employee_nomination_detail
      get :ajax_new_employee_nomination
      get :ajax_setup_payroll
      get :ajax_new_assigned_asset
      get :ajax_assigned_asset_detail
      get :joining_checklist
      get :manager
      get :transfer_form
      post :transfer_employee
      get :search_by_employee_manual_code
      get :transfer_employee_list
      get :report
      get :birthday_email
      get :birthday_invitation
      get :employee_list_for_revert
      get :revert_employee
      get :all_emp_list
      post :update_status
      get :ajax_employee_document_detail
      get :ajax_new_employee_document
      get :collect_company_location
      get :collect_company_location_dropdown_with_label
      get :collect_department
      get :collect_sub_department
      get :display_emp_code_master
      post :update_mgr
      get :index_xls
      get :basic_info_company_wise
      post :employee_basic_info
      post :basic_info
      get :change_password_form
      post :update_password
      get :destroy_employee
      post :show_employee_detail
      get :destroy_details
      get :edit_manager
      post :update_manager
      get :member_list_for_update_password
      get :reset_password
      get :all_employee_list
      get :left_employee_report
      post :dynamic_report
      get :left_employee_xl
      get :left_employee_pdf
      get :collect_employee
      get :select_company_company_location_and_department
      get :show_employee
      post :print_employee
      get :print_employee
      get :employee_list_pdf
      get :employee_report
      post :show_employee_list
      get :show_all_record
      post :show_all_record
      get :member_gps_form
      post :update_gps
      get :employee_gps_setting_list
      post :display_employee_details
      get :display_employee_details
      get :employee_detail_form
      get :employee_record_pdf
      get :is_confirm
      get :modal
      get :update_manager_modal
      get :new_employee_list
      get :skillset_employee_list
      get :update_skillset_modal
      get :reporting_manager_list
      get :employee_asset
      get :admin_asset_employee_list
      get :show_employee_dropdown
      get :collect_self_data
      get :import_basic_detail
      post :employee_basic_report
    end
    member do
      get :edit_manager
      patch :update_manager
      patch :transfer_employee
      get :transfer_form
    end
  end

  # resources :joining_details do
  #   collection do
  #     get :import_xl
  #     post :import
  #   end
  # end

  resources :blood_groups do
    collection do
      get :is_confirm
      get :blood_group_master
      post :blood_group_master
      get :import_xl
      post :import
    end
  end
  resources :nationalities do
    collection do
      get :is_confirm
      get :nationality_master
      post :nationality_master
      get :import_xl
      post :import
    end
  end
  resources :employee_types do
    collection do
      get :is_confirm
      get :employee_type_master
      post :employee_type_master
      get :import_xl
      post :import
    end
  end
  resources :department_types do
    collection do
      get :is_confirm
      get :department_type_master
      post :department_type_master
      get :import_xl
      post :import
    end
  end
  resources :company_types do
    collection do
      get :add_company_type
      post :create_company_type
      get :is_confirm
      get :company_type_master
      post :company_type_master
      get :import_xl
      post :import
    end
  end
  resources :departments do
    collection do
      get :department_list_xls
      get :is_confirm
      get :modal
    end
  end

  resources :company_locations
  resources :companies do
    collection do
      get :collect_cities
      get :collect_states
    end
  end

  resources :home do
    collection do
      get :created_user
      patch :update_form
      get :hrms_data_sheet
      get :assigned_user
      # get "downloads/xls/:id" => "downloads#xls", :as => :download_xls

      # get :show
    end
  end

  root 'home#index'

  devise_for :members, controllers: { registrations: 'members/registrations', sessions: 'members/sessions', passwords: 'members/passwords' }
  devise_for :groups, controllers: { registrations: 'groups/registrations', sessions: 'groups/sessions', passwords: 'groups/passwords' }

  devise_scope :group do
    get '/group' => 'groups/sessions#new'
  end

  devise_scope :member do
    get '/member' => 'members/sessions#new'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  

  namespace :api do
    resources :user_auths,:only => [:create], defaults: {format: 'json'}
    post 'user_auths/user_sign_in' => 'user_auths#user_sign_in', defaults: {format: 'json'}
    get 'user_auths/employee_list' => 'user_auths#employee_list', defaults:{format: 'json'}
    get 'user_auths/leave_request' => 'user_auths#leave_request', defaults:{format: 'json'}
    post 'user_auths/employee_leave_request' => 'user_auths#employee_leave_request', defaults:{format: 'json'}
    get 'user_auths/leave_category' => 'user_auths#leave_category', defaults:{format: 'json'}
    get 'user_auths/all_leave_request_list' => 'user_auths#all_leave_request_list', defaults:{format: 'json'}
    get 'user_auths/cancel_leave_request' => 'user_auths#cancel_leave_request', defaults:{format: 'json'}
    get 'user_auths/leave_approval_list' => 'user_auths#leave_approval_list', defaults:{format: 'json'}
    get 'user_auths/first_approved_employee_leave_requests' => 'user_auths#first_approved_employee_leave_requests', defaults:{format: 'json'}
    get 'user_auths/approve_leave_request' => 'user_auths#approve_leave_request', defaults:{format: 'json'} 
    get 'user_auths/reject_leave_request' => 'user_auths#reject_leave_request', defaults:{format: 'json'}
    post 'user_auths/employee_plan' => 'user_auths#employee_plan', defaults:{format: 'json'}
    get 'user_auths/employee_plan_list' => 'user_auths#employee_plan_list', defaults:{format: 'json'}
    post 'user_auths/update_employee_plan' => 'user_auths#update_employee_plan', defaults:{format: 'json'}
    get 'user_auths/cancel_employee_plan' => 'user_auths#cancel_employee_plan', defaults:{format: 'json'}
    get 'user_auths/holiday_setup' => 'user_auths#holiday_setup', defaults:{format: 'json'}
    get 'user_auths/employee_contact_library' => 'user_auths#employee_contact_library', defaults:{format: 'json'}
    get 'user_auths/employee_details' => 'user_auths#employee_details', defaults:{format: 'json'}
    get 'user_auths/manager1_employee_list' => 'user_auths#manager1_employee_list', defaults:{format: 'json'}
    get 'user_auths/manager2_employee_list' => 'user_auths#manager2_employee_list', defaults:{format: 'json'}
    get 'user_auths/contact_details' => 'user_auths#contact_details', defaults:{format: 'json'}
    post 'user_auths/meeting_plan_approve' => 'user_auths#meeting_plan_approve', defaults:{format: 'json'}
    get 'user_auths/approve_plan_list' => 'user_auths#approve_plan_list', defaults:{format: 'json'}
    get 'user_auths/manager_approve_plan_list' => 'user_auths#manager_approve_plan_list', defaults:{format: 'json'}
    get 'user_auths/particular_employee_plan_list' => 'user_auths#particular_employee_plan_list', defaults:{format: 'json'}
    get 'user_auths/reject_plan' => 'user_auths#reject_plan', defaults:{format: 'json'}
    get 'user_auths/all_employee_list' => 'user_auths#all_employee_list', defaults:{format: 'json'}
    get 'user_auths/on_duty_requests' => 'user_auths#on_duty_requests', defaults:{format: 'json'}
    get 'user_auths/on_duty_requests_cancel' => 'user_auths#on_duty_requests_cancel', defaults:{format: 'json'}
    get 'user_auths/all_employee_plan_list' => 'user_auths#all_employee_plan_list', defaults:{format: 'json'}
    get 'user_auths/all_aprove_plan_list' => 'user_auths#all_aprove_plan_list', defaults:{format: 'json'}
    post 'user_auths/create_on_duty_requests' => 'user_auths#create_on_duty_requests', defaults:{format: 'json'}
    get 'user_auths/list_of_faq' => 'user_auths#list_of_faq', defaults:{format: 'json'}
    get 'user_auths/od_request_approval_list' => 'user_auths#od_request_approval_list', defaults:{format: 'json'}
    get 'user_auths/od_employee_request_detail' => 'user_auths#od_employee_request_detail', defaults:{format: 'json'}
    get 'user_auths/od_request_first_approve' => 'user_auths#od_request_first_approve', defaults:{format: 'json'}
    get 'user_auths/od_request_second_approve' => 'user_auths#od_request_second_approve', defaults:{format: 'json'}
    get 'user_auths/od_request_first_reject' => 'user_auths#od_request_first_reject', defaults:{format: 'json'}
    get 'user_auths/od_request_second_reject' => 'user_auths#od_request_second_reject', defaults:{format: 'json'}
    get 'user_auths/comp_off_approval_first' => 'user_auths#comp_off_approval_first', defaults:{format: 'json'}
    get 'user_auths/comp_off_approval_second' => 'user_auths#comp_off_approval_second', defaults:{format: 'json'}
    post 'user_auths/employee_feedback' => 'user_auths#employee_feedback', defaults:{format: 'json'}
    get 'user_auths/resignation_history' => 'user_auths#resignation_history', defaults:{format: 'json'}
    get 'user_auths/plan_reason_list' => 'user_auths#plan_reason_list', defaults:{format: 'json'}
    post 'user_auths/employee_reason' => 'user_auths#employee_reason', defaults:{format: 'json'}
    post 'user_auths/attendance_data' => 'user_auths#attendance_data', defaults:{format: 'json'}
    get 'user_auths/admin_all_leave_request_list' => 'user_auths#admin_all_leave_request_list', defaults:{format: 'json'}
    get 'user_auths/admin_employee_history' => 'user_auths#admin_employee_history', defaults:{format: 'json'}
    get 'user_auths/employee_daily_attendance' => 'user_auths#employee_daily_attendance', defaults:{format: 'json'}
    post 'user_auths/employee_location_history' => 'user_auths#employee_location_history', defaults:{format: 'json'}
    get 'user_auths/daily_att_count' => 'user_auths#daily_att_count', defaults:{format: 'json'}
    get 'user_auths/company_logo' => 'user_auths#company_logo', defaults:{format: 'json'}
    get 'user_auths/admin_od_request_approval_list' => 'user_auths#admin_od_request_approval_list', defaults:{format: 'json'}
    get 'user_auths/current_location_particular_emp' => 'user_auths#current_location_particular_emp', defaults:{format: 'json'}
    get 'user_auths/emp_salary_slip_list' => 'user_auths#emp_salary_slip_list', defaults:{format: 'json'}
    get 'user_auths/project_master_list' => 'user_auths#project_master_list', defaults:{format: 'json'}
    post 'user_auths/emp_daily_activity' => 'user_auths#emp_daily_activity', defaults:{format: 'json'}
    get 'user_auths/emp_addable_salary_details' => 'user_auths#emp_addable_salary_details', defaults:{format: 'json'}
    get 'user_auths/emp_deducted_salary_details' => 'user_auths#emp_deducted_salary_details', defaults:{format: 'json'}
    get 'user_auths/emp_activity' => 'user_auths#emp_activity', defaults:{format: 'json'}
    get 'user_auths/emp_details_salary_slip' => 'user_auths#emp_details_salary_slip', defaults:{format: 'json'}
    get 'user_auths/emp_daily_activity_list' => 'user_auths#emp_daily_activity_list', defaults:{format: 'json'}
    get 'user_auths/emp_salary_slip_data' => 'user_auths#emp_salary_slip_data', defaults:{format: 'json'}
    get 'user_auths/employee_wise_attendance' => 'user_auths#employee_wise_attendance', defaults:{format: 'json'}
    get 'user_auths/date_wise_location_history' => 'user_auths#date_wise_location_history', defaults:{format: 'json'}
    get 'user_auths/leave_coff' => 'user_auths#leave_coff', defaults:{format: 'json'}
    post 'user_auths/notes_details' => 'user_auths#notes_details', defaults:{format: 'json'}
    get 'user_auths/all_plan_list' => 'user_auths#all_plan_list', defaults:{format: 'json'}
    get 'user_auths/listed_company' => 'user_auths#listed_company', defaults:{format: 'json'}
    post 'user_auths/start_meeting' => 'user_auths#start_meeting', defaults:{format: 'json'}
    post 'user_auths/end_meeting' => 'user_auths#end_meeting', defaults:{format: 'json'}
    post 'user_auths/meeting_minutes' => 'user_auths#meeting_minutes', defaults:{format: 'json'}
    get 'user_auths/meeting_plan_minutes' => 'user_auths#meeting_plan_minutes', defaults:{format: 'json'}
    get 'user_auths/particular_emp_status_wise_plan_list' => 'user_auths#particular_emp_status_wise_plan_list', defaults:{format: 'json'}
    get 'user_auths/notifications_count' => 'user_auths#notifications_count', defaults:{format: 'json'}
    post 'user_auths/employee_wise_date' => 'user_auths#employee_wise_date', defaults:{format: 'json'}
    post 'user_auths/holiday_setup_manager' => 'user_auths#holiday_setup_manager', defaults:{format: 'json'}
    get 'user_auths/manager_wise_emp_list' => 'user_auths#manager_wise_emp_list', defaults:{format: 'json'}
    get 'user_auths/admin_wise_emp_list' => 'user_auths#admin_wise_emp_list', defaults:{format: 'json'}
    get 'user_auths/manager_wise_att' => 'user_auths#manager_wise_att', defaults:{format: 'json'}
    post 'user_auths/manager_attendance_list' => 'user_auths#manager_attendance_list', defaults:{format: 'json'}
    get 'user_auths/admin_att' => 'user_auths#admin_att', defaults:{format: 'json'}
    post 'user_auths/admin_attendance_list' => 'user_auths#admin_attendance_list', defaults:{format: 'json'}
    get 'user_auths/yearly_company_holiday' => 'user_auths#yearly_company_holiday', defaults:{format: 'json'}
    get 'user_auths/all_employee_details' => 'user_auths#all_employee_details', defaults:{format: 'json'}
    get 'user_auths/all_emp_leave_details' => 'user_auths#all_emp_leave_details', defaults:{format: 'json'}
    get 'user_auths/all_emp_od_details' => 'user_auths#all_emp_od_details', defaults:{format: 'json'}
    get 'user_auths/all_com_off_request_list' => 'user_auths#all_com_off_request_list', defaults:{format: 'json'}
    post 'user_auths/employee_c_off_request' => 'user_auths#employee_c_off_request', defaults:{format: 'json'}
    get 'user_auths/travel_option_list' => 'user_auths#travel_option_list', defaults:{format: 'json'}
    get 'user_auths/travel_mode_list' => 'user_auths#travel_mode_list', defaults:{format: 'json'}
    post 'user_auths/employee_travel_request' => 'user_auths#employee_travel_request', defaults:{format: 'json'}
    get 'user_auths/travel_approval_list' => 'user_auths#travel_approval_list', defaults:{format: 'json'}
    get 'user_auths/cancel_travel_request' => 'user_auths#cancel_travel_request', defaults:{format: 'json'}
    get 'user_auths/com_off_aprroval_list' => 'user_auths#com_off_aprroval_list', defaults:{format: 'json'}
    get 'user_auths/admin_com_off_aprroval' => 'user_auths#admin_com_off_aprroval', defaults:{format: 'json'}
    get 'user_auths/approve_c_off_request' => 'user_auths#approve_c_off_request', defaults:{format: 'json'}
    get 'user_auths/reject_c_off_request' => 'user_auths#reject_c_off_request', defaults:{format: 'json'}
    get 'user_auths/travel_request_list' => 'user_auths#travel_request_list', defaults:{format: 'json'}
    get 'user_auths/admin_travel_approval_list' => 'user_auths#admin_travel_approval_list', defaults:{format: 'json'}
    get 'user_auths/expense_claim_list' => 'user_auths#expense_claim_list', defaults:{format: 'json'}
    get 'user_auths/expense_type_list' => 'user_auths#expense_type_list', defaults:{format: 'json'}
    get 'user_auths/all_currency' => 'user_auths#all_currency', defaults:{format: 'json'}
    get 'user_auths/claim_list' => 'user_auths#claim_list', defaults:{format: 'json'}
    get 'user_auths/cancel_coff_request' => 'user_auths#cancel_coff_request', defaults:{format: 'json'}
    get 'user_auths/approve_travel_request' => 'user_auths#approve_travel_request', defaults:{format: 'json'}
    get 'user_auths/reject_travel_request' => 'user_auths#reject_travel_request', defaults:{format: 'json'}
    get 'user_auths/final_approval_travel_list' => 'user_auths#final_approval_travel_list', defaults:{format: 'json'}
    post 'user_auths/employee_expense_claim_request' => 'user_auths#employee_expense_claim_request', defaults:{format: 'json'}
    get 'user_auths/edit_claim' => 'user_auths#edit_claim', defaults:{format: 'json'}
    get 'user_auths/delete_expense_claim' => 'user_auths#delete_expense_claim', defaults:{format: 'json'}
    post 'user_auths/employee_claim_request' => 'user_auths#employee_claim_request', defaults:{format: 'json'}
    get 'user_auths/claim_list_total' => 'user_auths#claim_list_total', defaults:{format: 'json'}
    get 'user_auths/final_reject_travel_request' => 'user_auths#final_reject_travel_request', defaults:{format: 'json'}
    get 'user_auths/final_approve_travel_request' => 'user_auths#final_approve_travel_request', defaults:{format: 'json'}
    get 'user_auths/expense_claim_approval_list' => 'user_auths#expense_claim_approval_list', defaults:{format: 'json'}
    get 'user_auths/all_claim_expense_list' => 'user_auths#all_claim_expense_list', defaults:{format: 'json'}
    get 'user_auths/second_expense_claim_list' => 'user_auths#second_expense_claim_list', defaults:{format: 'json'}
    get 'user_auths/claim_approve_request' => 'user_auths#claim_approve_request', defaults:{format: 'json'}
    get 'user_auths/admin_expense_claim_approval_list' => 'user_auths#admin_expense_claim_approval_list', defaults:{format: 'json'}
    get 'user_auths/all_travel_history' => 'user_auths#all_travel_history', defaults:{format: 'json'}
    get 'user_auths/cancel_travel_history' => 'user_auths#cancel_travel_history', defaults:{format: 'json'}
    get 'user_auths/get_time_sheet' => 'user_auths#get_time_sheet', defaults:{format: 'json'}
    get 'user_auths/get_help_disk_list' => 'user_auths#get_help_disk_list', defaults:{format: 'json'}
    get 'user_auths/all_issue_tracker_group' => 'user_auths#all_issue_tracker_group', defaults:{format: 'json'}
    get 'user_auths/cancel_help_desk_request' => 'user_auths#cancel_help_desk_request', defaults:{format: 'json'}
    get 'user_auths/group_type' => 'user_auths#group_type', defaults:{format: 'json'}
    get 'user_auths/collect_issues' => 'user_auths#collect_issues', defaults:{format: 'json'}
    get 'user_auths/daily_bill_request_confirmation' => 'user_auths#daily_bill_request_confirmation', defaults:{format: 'json'}
    get 'user_auths/lock_request_list' => 'user_auths#lock_request_list', defaults:{format: 'json'}
    get 'user_auths/solved_issue_list' => 'user_auths#solved_issue_list', defaults:{format: 'json'}
    get 'user_auths/manager_daily_attendance' => 'user_auths#manager_daily_attendance', defaults:{format: 'json'}
    get 'user_auths/collect_issues_description' => 'user_auths#collect_issues_description', defaults:{format: 'json'}
    post 'user_auths/create_support_request' => 'user_auths#create_support_request', defaults:{format: 'json'}
    get 'user_auths/unlock_request' => 'user_auths#unlock_request', defaults:{format: 'json'}
    post 'user_auths/lock_request' => 'user_auths#lock_request', defaults:{format: 'json'}
    post 'user_auths/solved_request' => 'user_auths#solved_request', defaults:{format: 'json'}
    get 'user_auths/issue_tracker_member_list' => 'user_auths#issue_tracker_member_list', defaults:{format: 'json'}
    get 'user_auths/support_root_cause_list' => 'user_auths#support_root_cause_list', defaults:{format: 'json'}
    get 'user_auths/solved_confirm' => 'user_auths#solved_confirm', defaults:{format: 'json'}
    get 'user_auths/resend_request' => 'user_auths#resend_request', defaults:{format: 'json'}
    get 'user_auths/active_leaving_reason' => 'user_auths#active_leaving_reason', defaults:{format: 'json'}
    get 'user_auths/display_notice_period' => 'user_auths#display_notice_period', defaults:{format: 'json'}
    post 'user_auths/create_self_resignation' => 'user_auths#create_self_resignation', defaults:{format: 'json'}
    get 'user_auths/pending_resignation_requests' => 'user_auths#pending_resignation_requests', defaults:{format: 'json'}
    get 'user_auths/first_approved_resignation_requests' => 'user_auths#first_approved_resignation_requests', defaults:{format: 'json'}
  end
end

