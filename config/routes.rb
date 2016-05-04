
Rails.application.routes.draw do
  resources :particular_vacancy_requests
  resources :travel_expences
  resources :daily_bill_details 
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
    end
  end
  namespace :reports do
  get 'monthly_expences_details/new'
  end

  namespace :reports do
  get 'society_membership_details/new'
  end

  namespace :reports do
  get 'retention_money_details/new'
  end

  namespace :reports do
  get 'professional_tax_details/new'
  post 'professional_tax_details/professional_tax_detail_report'
  end

  namespace :reports do
  get 'welfare_details/new'
  end

  resources :rating_masters
  namespace :reports do
    get 'overtime_salary_details/new'
    post 'overtime_salary_details/overtime_montly_detail_report'
  end

  namespace :reports do
    get 'overtime_salary_details/daily'
    post 'overtime_salary_details/overtime_daily_detail_report'

  end

  namespace :reports do
    get 'food_deduction_details/new'
    post 'food_deduction_details/food_deduction_detail_report'
  end

  namespace :reports do
    get 'ctc_details/new'
    post 'ctc_details/ctc_detail_report'
  end

  namespace :reports do
    get 'esic_details/new'
    post 'esic_details/esic_detail_report'
  end

  namespace :reports do
    get 'pf_details/new'
    post 'pf_details/pf_detail_report'
  end

  namespace :reports do
    get 'instalment_details/new'
    post 'instalment_details/instalment_detail_report'
  end

  namespace :reports do
    get 'advance_salaries/new'
    post 'advance_salaries/advance_salary_report'
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
    end
  end

  namespace :reports do
    get 'family_details/new'
    post 'family_details/family_detail_report'
  end

  namespace :reports do
    get 'physical_details/new'
    post 'physical_details/physical_detail_report'
  end

  namespace :reports do
    get 'award_details/new'
    post 'award_details/award_detail_report'
  end

  namespace :reports do
    get 'certification_details/new'
    post 'certification_details/certification_detail_report'
  end

  namespace :reports do
    get 'skillset_details/new'
    post 'skillset_details/skillset_detail_report'
  end

  namespace :reports do
    get 'experience_details/new'
    post 'experience_details/experience_detail_report'
  end

  namespace :reports do
    get 'qualification_details/new'
    post 'qualification_details/qualification_detail_report'
  end

  namespace :reports do
    get 'bank_details/new'
    post 'bank_details/bank_detail_report'
  end

  namespace :reports do
  get 'joining_details/new'
  post 'joining_details/joining_detail_report'
  get 'joining_details/collect_departments'
  end

  namespace :reports do
  get 'basic_details/new'
  post 'basic_details/employee_basic_report'
  get 'basic_details/collect_departments'
  get 'basic_details/employee_list'
  end

  namespace :reports do
  end

  resources :accident_records do
    collection do
      get :collect_esic
    end
  end

  resources :performance_periods
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
    end
  end

  resources :definitions
  resources :attribute_masters
  resources :goal_measures
  resources :goal_perspectives
  resources :particular_leave_records do
    collection do
      get :show_leave_record
    end
  end

  match 'capture_resumes/:id/download/:id' => 'capture_resumes#download', :via => [:get], :as => :download
  match 'capture_resumes/:id/download_photo/:id' => 'capture_resumes#download_photo', :via => [:get], :as => :download_photo
  match 'interview_schedules/:id/send_email_to_candidate/:id' => 'interview_schedules#send_email_to_candidate', :via => [:get], :as => :send_email_to_candidate
  match 'interview_schedules/:id/sample_email_to_interviewer/:id' => 'interview_schedules#sample_email_to_interviewer', :via => [:get], :as => :sample_email_to_interviewer

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
    end
  end
  resources :bonus_masters
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
  resources :overtime_masters
  resources :reserved_categories
  resources :pf_masters
  resources :professional_taxes
  resources :society_member_ships
  resources :well_faires
  resources :monthly_expences do
    collection do
      get :employees
      get :employee_expences
    end
  end
  resources :expencess_types
  resources :food_coupan_masters
  resources :food_deductions do
    collection do
      get :calculate_food_deduction_amount
      get :employees
    end
  end
  resources :reporting_masters
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
  resources :advance_types
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
    end
  end
  resources :retention_moneys
  namespace :reports do
    get 'salaries/new'
    post 'salaries/date_range_report'
    get 'salaries/download'
    # post 'salaries/department_wise'
    # get 'salaries/show'
    post 'salaries/ctc_yearly_report'
    get 'salaries/ctc_yearly'
    # post 'employee_reports/basic_detail_report'
    # get 'employee_reports/show'
    # post 'basic_detail/basic_detail_report'
    # get 'basic_detail/new'
  end

  resources :payment_modes
  resources :excel_exports do
    collection do
      get :payroll
    end
  end
  resources :esic_masters
  resources :excel_uploads do
    collection do
      post :load_excel
    end
  end
  resources :employee_categories
  resources :other_salary_components
  resources :salaryslip_components
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
    end
  end
  
  resources :pdf_salaries do
     collection do
        get :employee_list_pdf
        get :select_month_year_form
        get :show_employee
        post :print_salary_slip_monthwise
     end
   end  
  
  resources :salary_slip_ledgers do
     collection do
        get :select_month_year_form
        get :show_employee
        post :print_salary_slip_monthwise
     end
   end  

  resources :instalments do
    collection do
      get :employees
    end
  end
  resources :advance_salaries do
    collection do
      get :search_by_advance_date
      get :advances
    end
  end
  resources :workingdays do
    collection do
      get :employees
      get :search_month_year
      get :generate_workingday
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
  resources :holidays
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
    end
  end
  resources :salary_component_templates
  resources :salary_templates
  resources :religions
  resources :banks
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
    end
  end
  resources :universities
  resources :degree_streams
  resources :degree_types
  resources :districts
  resources :states
  resources :countries
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
  resources :leav_categories
  resources :employee_physicals
  resources :joining_details do
    collection do
      get :search_by_joining_date
    end
  end
  resources :employee_grades
  resources :awards do
    collection do
      get :add_award_field
    end
  end
  resources :skillsets
  resources :experiences
  resources :certifications
  resources :qualifications
  resources :families do
    collection do
      get :ajax_show_handicap_type_textbox
      get :ajax_show_passport_detail_textbox
    end
  end
  resources :employees do
    collection do
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
      get :ajax_setup_payroll
      get :manager
      get :transfer_form
      post :transfer_employee
      get :search_by_employee_manual_code
      get :transfer_employee_list
      get :report
      get :birthday_email
      get :birthday_invitation
    end
    member do
      get :edit_manager
      patch :update_manager
      patch :transfer_employee
      get :transfer_form
    end
  end
  resources :blood_groups
  resources :nationalities
  resources :employee_types
  resources :department_types
  resources :company_types do
    collection do
      get :add_company_type
      post :create_company_type
    end
  end
  resources :departments
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
