Rails.application.routes.draw do
  resources :employee_bank_details
  resources :leav_cancelleds
  resources :employee_leav_balances
  resources :leav_rejecteds
  resources :leav_aproveds
  resources :employee_leav_requests do
    collection do
      get :approved_or_rejected_leave_request
    end
  end
  resources :company_leavs
  resources :leav_categories
  resources :employee_physicals
  resources :joining_details
  resources :employee_grades
  resources :awards do
    collection do
      get :add_award_field
    end
  end
  resources :skillsets
  resources :experinces
  resources :certifications
  resources :qualifications
  resources :families
  resources :employees
  resources :blood_groups
  resources :nationalities
  resources :employee_types
  resources :department_types
  resources :company_types
  resources :departments
  resources :company_locations
  resources :companies
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
