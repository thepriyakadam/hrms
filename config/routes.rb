
Rails.application.routes.draw do
  
  resources :week_offs
  resources :employee_leav_request_reports, :only => [:index]

  resources :capture_resumes
  resources :interview_schedules do
    collection do
    get :search_by_interview_date
    end
end
  resources :vacancy_masters do
    collection do
    get :search_by_vacancy_post_date
    post :import  
    end
end  
  resources :leave_c_offs do
    collection do
      get :search_by_c_off_date
    end
  end

  resources :particular_leave_records do
    collection do
      get :show_leave_record
    end
  end
  
  match 'capture_resumes/:id/download/:id' => 'capture_resumes#download', :via => [:get], :as => :download
  
  resources :leave_c_offs
  resources :overtime_month_records
  resources :overtime_daily_records
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
      get :select_month_year_form
      get :collect_employee
      post :create_overtime_salary
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
    post 'salaries/date_range_report'
    get 'salaries/new'
    post 'salaries/department_wise'
    get 'salaries/show'
    post 'salaries/ctc_yearly_report'
    get 'salaries/ctc_yearly'
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
    end
  end
  resources :workingdays do
    collection do
      get :employees
      get :search_month_year
      get :generate_workingday
    end
  end
  resources :shift_rotations
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
    end
    member do
      get :edit_manager
      patch :update_manager
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

  devise_for :members, :controllers => {registrations: 'members/registrations',sessions: 'members/sessions',passwords: 'groups/passwords'}
  devise_for :groups, :controllers => {registrations: 'groups/registrations',sessions: 'groups/sessions',passwords: 'groups/passwords'}

  devise_scope :group do
    get "/group" => "groups/sessions#new"
  end

  devise_scope :member do
    get "/member" => "members/sessions#new"
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
