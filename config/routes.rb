Rails.application.routes.draw do

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
      get :datewise_report_list
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
      get :memberwise_report_list
      
    end
   end
  resources :issue_masters do
    collection do
      get :collect_issues
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
       get :collect_issues
       get :collect_memberwise_dropdown
    end
   end
  resources :issue_tracker_groups do
    collection do

  end
end

  resources :leave_masters

  resources :employee_code_masters do
    collection do
       get :is_confirm
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
    end
   end
  resources :due_actions
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

  resources :investment_declarations
  resources :investment_heads
  resources :sections
  resources :employee_documents do
    collection do
      get :form16
    end
  end

  resources :company_policies do
    collection do
      get :active_policies_list
    end
  end

  resources :date_formats do
    collection do
    get :active
    post :activee
    end
  end

  resources :email_configs
  resources :weekoff_masters
  resources :currency_masters do
    collection do
      get :is_confirm
    end
  end
  resources :illness_types do
    collection do
      get :is_confirm
    end
  end
  resources :performance_calendars do
    collection do
      get :is_confirm
    end
  end
  resources :performance_activities do
    collection do
      get :is_confirm
    end
  end
 
  resources :years do
    collection do
      get :is_confirm
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
    end
  end
  resources :circulars do
    collection do
      get :is_confirm
    end
  end

  resources :salary_map_saps
  resources :interview_rounds do
    collection do
      get :interview_round_reschedule
      post :reschedule_interview
      get :interview_reschedule_list
    end
  end
  resources :interview_types do
    collection do
      get :is_confirm
    end
  end
  resources :employee_attendances do
    collection do
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
      get :employee_slip
      get :employee_slip_xls
      post :display_attendance
      get :display_attendance_1
      get :revert_attendance_employeewise
      post :show_employee_list
      post :destroy_attendance_employeewise
      get :loginwise_attendance_form
      get :display_employee_attendance_list
      get :employee_attendances_list
      get :emp_attendance
      get :display_attendance_2
      get :employee_slip_xls_1
    end
  end
  resources :salary_comp_mappings
  resources :company_events
  resources :employee_task_to_dos do
    collection do
      get :dynamic_refresh
    end
  end


  resources :leaving_reasons do
    collection do
      get :is_confirm
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
      get :attribute_modal
      patch :update_attribute_modal
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
      patch :update_goal_set_modal
      get :attribute_set_modal
      patch :update_attribute_set_modal
      get :trainee_list
      post :print_employee_detail
      get :all_emp_list
      get :increment_index
      post :all_employee_list
      post :print_employee_list
      get :is_confirm
    end
  end
  #post 'goal_ratings/update_goal_set_modal'
  resources :goal_bunches do
    collection do
      get :goal_approval
      post :appraiser_confirm
      get :appraisee_comment
      post :self_comment
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
     
    end
  end
  resources :goal_perspectives do
    collection do
      get :is_confirm
    end
  end
  resources :ratings do
    collection do
      get :is_confirm
    end
  end
  resources :periods do
    collection do
      get :is_confirm
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
    end
  end
  resources :about_bosses do
    collection do
      get :is_confirm
    end
  end
  resources :question_masters do
    collection do
      get :is_confirm
    end
  end
  resources :training_records
  resources :leaving_reasons do
    collection do
      get :is_confirm
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
    end
  end
  resources :accident_masters
  resources :travel_expence_types do
    collection do
      get :is_confirm
    end
  end
  resources :travel_modes do
    collection do
      get :is_confirm
    end
  end
  resources :interview_analyses do
    collection do
      post :print_interview_analysis_list
    end
  end
  resources :interview_decisions do
    collection do
      get :is_confirm
    end
  end
  resources :interview_attributes do
    collection do
      get :is_confirm
    end
  end
  resources :interview_evalutions do
    collection do
      get :is_confirm
    end
  end
  resources :training_topic_masters do
    collection do
      get :is_confirm
    end
  end

  resources :employee_resignations do
    collection do
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
  end
end
  resources :travel_options do
    collection do
      get :is_confirm
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
      post :approve_and_send_next
      get :approve_training_request
      get :modal_approve_and_send_next
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
    end
  end
  resources :assigned_assets do
    collection do
    post :update_asset
    get :modal
    get :update_asset
    end
  end
  resources :asset_types do
    collection do
      get :is_confirm
    end
  end
  resources :employee_nominations
  resources :nomination_masters do
    collection do
      get :is_confirm
    end
  end
  resources :relation_masters do
    collection do
      get :is_confirm
    end
  end
  resources :particular_vacancy_requests
  resources :travel_expences
  resources :daily_bill_details do
    collection do
    # post :is_confirm
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
    end
  end
  resources :travel_requests do
    collection do
      get :daily_bill
      get :travel_history
      get :travel_request_confirmation
      get :approve_travel_request
      get :reject_travel_request
      post :send_request_to_higher_authority
      get :modal
      get :cancel_travel_request
      get :travel_request_list
      get :edit_and_send_next_modal
      post :edit_and_send_next_modal_submit
      get :edit_and_approve_modal
      post :edit_and_approve_modal_submit
      get :is_confirm
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

    get 'family_details/new'
    post 'family_details/family_detail_report'
 
    get 'physical_details/new'
    post 'physical_details/physical_detail_report'
 
    get 'award_details/new'
    post 'award_details/award_detail_report'
 
    get 'certification_details/new'
    post 'certification_details/certification_detail_report'
 
    get 'skillset_details/new'
    post 'skillset_details/skillset_detail_report'
 
    get 'experience_details/new'
    post 'experience_details/experience_detail_report'
 
    get 'qualification_details/new'
    post 'qualification_details/qualification_detail_report'
 
    get 'bank_details/new'
    post 'bank_details/bank_detail_report'

    get 'joining_details/new'
    post 'joining_details/joining_detail_report'
    get 'joining_details/collect_departments'

    get 'basic_details/new'
    post 'basic_details/employee_basic_report'
    get 'basic_details/employee_basic_info'
    get 'basic_details/collect_departments'
    get 'basic_details/employee_list'
    get 'basic_details/select_department'
    post 'basic_details/list_of_employee'

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

  resources :week_offs
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
    end
  end
  resources :leave_c_offs do
    collection do
      get :search_by_c_off_date
    end
  end

  resources :self_services do
    collection do
      get :employee
      get :employee_template
      get :salaryslip
      get :advance
      get :attendance
      get :employee_resignation
      get :resignation_history
      get :show_resignation_detail
      get :employee_transfer
      get :travel_request
    end
  end

  resources :accident_records do
    collection do
      get :collect_esic
    end
  end

  resources :attribute_rating_sheets do
    collection do
      get :edit_appraiser
      get :edit_attribute_rating
      patch :update_appraiser
      get :appraiser
      post :appraiser_create
      post :is_confirm_appraiser
      post :is_confirm_appraisee
      get :employee_details
      get :employee_info
      get :subordinate_list
      get :appraiser2
      post :appraiser2_create
      get :final_comment
      post :final_create
      get :edit_final
      patch :update_final
      post :is_confirm_final
      post :is_confirm_appraiser2
      get :edit_appraiser2
      patch :update_appraiser2
      get :employee_list
      get :employee_final_details
      get :subordinate_list2
      get :employee_appraiser2_details
      get :modal
      patch :update_modal
      get :modal_appraiser
      patch :update_appraiser_modal
      get :modal_appraiser2
      patch :update_appraiser2_modal
      get :modal_final
      patch :update_final_modal
      get :print_details_appraiser
      get :print_details_final
      get :print_details_appraiser2
      get :send_email_to_appraiser
      get :send_email_to_appraiser2
      get :try
    end
  end
  resources :goal_rating_sheets do
    collection do
      post :is_confirm_appraisee
      post :is_confirm_appraiser
      get :edit_appraiser
      patch :update_appraiser
      delete :destroy_appraiser
      get :subordinate_list
      get :edit_goal_rating
      get :appraiser
      post :appraiser_create
      get :appraisee_goal_list
      get :subordinate_list2
      get :appraiser2
      post :appraiser2_create
      get :edit_appraiser2
      patch :update_appraiser2
      get :employee_list
      get :final_comment
      post :final_create
      get :edit_final
      patch :update_final
      post :is_confirm_final
      post :is_confirm_appraiser2
      get :modal
      patch :update_modal
      get :modal_appraiser
      patch :update_appraiser_modal
      get :modal_appraiser2
      patch :update_appraiser2_modal
      get :modal_final
      patch :update_final_modal
      get :appraiser1_approval
      get :appraiser1_subordinate
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
    end
  end
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

  match 'daily_bill_details/:id/download_doc/:id' => 'daily_bill_details#download_doc', :via => [:get], :as => :download_doc
  match 'daily_bill_details/:id/download_pics/:id' => 'daily_bill_details#download_pics', :via => [:get], :as => :download_pics
  match 'company_policies/:id/download_docs/:id' => 'company_policies#download_docs', :via => [:get], :as => :download_docs
  match 'employee_documents/:id/download_emp/:id' => 'employee_documents#download_emp', :via => [:get], :as => :download_emp
  match 'employee_documents/:id/download_pic/:id' => 'employee_documents#download_pic', :via => [:get], :as => :download_pic
  match 'investment_declarations/:id/investment_document/:id' => 'investment_declarations#investment_document', :via => [:get], :as => :investment_document
  match 'due_templates/:id/download_due_tempalte_documents/:id' => 'due_templates#download_due_tempalte_documents', :via => [:get], :as => :download_due_tempalte_documents

  match 'issue_requests/:id/download_screenshot_image/:id' => 'issue_requests#download_screenshot_image', :via => [:get], :as => :download_screenshot_image
  match 'issue_requests/:id/download_screenshot/:id' => 'issue_requests#download_screenshot', :via => [:get], :as => :download_screenshot

  resources :leave_c_offs
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
    end
  end
  resources :pf_masters do
    collection do
      get :is_confirm
    end
  end
  resources :professional_taxes do
    collection do
      get :is_confirm
    end
  end
  resources :society_member_ships
  resources :well_faires do
    collection do
      get :is_confirm
    end
  end
  resources :monthly_expences do
    collection do
      get :employees
      get :employee_expences
    end
  end
  resources :expencess_types do
    collection do
      get :is_confirm
    end
  end
  resources :food_coupan_masters do
    collection do
      get :is_confirm
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
      post :dynamic_report
      get :food_deduction_xls_1
      get :food_deduction_pdf_1
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
    end
  end
  resources :advance_types do
    collection do
      get :is_confirm
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
    end
  end
  resources :retention_moneys do
    collection do
      get :select_form
      get :is_confirm
    end
  end
 
  resources :payment_modes do
    collection do
      get :is_confirm
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
    end
   end
 
  resources :salary_slip_ledgers do
    collection do
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
      post :show_monthly_ctc
      get :pf_detail_report
      post :dynamic_report
      get :pf_detail_pdf
      get :pf_detail_xls
      get :select_bank_wise
      get :show_employee_list
      # post :dynamic_report
      # get :pf_detail_pdf
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
      get :installment_pdf_1
      get :installment_xls_1
    end
  end
  resources :advance_salaries do
    collection do
      get :search_by_advance_date
      get :advances
      get :advance_salary_report
      post :dynamic_report
      get :advance_salary_xls
      get :advance_salary_pdf
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
      get :workingday_xls
      get :workingday_pdf
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
      get :assign_to_employee
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
    end
  end
  resources :banks do
    collection do
      get :is_confirm
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
    end
  end
  resources :universities do
    collection do
      get :is_confirm
    end
  end
  resources :degree_streams do
    collection do
      get :is_confirm
    end
  end
  resources :degree_types do
    collection do
      get :is_confirm
    end
  end
  resources :districts
  resources :states
  resources :countries
  resources :employee_designations do
    collection do
      get :is_confirm
      get :employee_designation_list
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
    end
  end
  resources :universities
  resources :degree_streams
  resources :degree_types
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
    end

    member do
      get :edit_role
      patch :update_role
    end
  end
  resources :employee_bank_details
  resources :leav_cancelleds

  resources :employee_leav_balances do
    collection do
      get :collect_employee_for_leave
      get :employee_leave_balance
      get :leave_balance_modal
      patch :update_leave_balance
      get :is_confirm_leave
      patch :update_leave_auto
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
    end
  end
  resources :company_leavs
  resources :leav_categories do
    collection do
      get :is_confirm
    end
  end
  resources :employee_physicals
  resources :joining_details do
    collection do
      get :search_by_joining_date
    end
  end
  resources :employee_grades do
    collection do
      get :is_confirm
    end
  end
  resources :awards do
    collection do
      get :add_award_field
    end
  end
  resources :skillsets
  resources :experiences  do
    collection do
      get :modal_experience
      post :update_experience
    end
  end
  resources :certifications
  resources :qualifications do
    collection do
      get :modal
      post :update_qualification
     end
   end
  resources :families do
    collection do
      get :ajax_show_handicap_type_textbox
      get :ajax_show_passport_detail_textbox
    end
  end
  resources :employees do
    collection do
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
      get :collect_department
      get :display_emp_code_master
      post :update_mgr
      get :collect_company_loc
      get :index_xls
      get :basic_info_company_wise
      post :employee_basic_info
      post :basic_info
    end
    member do
      get :edit_manager
      patch :update_manager
      patch :transfer_employee
      get :transfer_form
    end
  end
  resources :blood_groups do
    collection do
      get :is_confirm
    end
  end
  resources :nationalities do
    collection do
      get :is_confirm
    end
  end
  resources :employee_types do
    collection do
      get :is_confirm
    end
  end
  resources :department_types do
    collection do
      get :is_confirm
    end
  end
  resources :company_types do
    collection do
      get :add_company_type
      post :create_company_type
      get :is_confirm
    end
  end
  resources :departments do
    collection do
      get :department_list_xls
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
    end
  end

  root 'home#index'

  devise_for :members, controllers: { registrations: 'members/registrations', sessions: 'members/sessions', passwords: 'groups/passwords' }
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
end
