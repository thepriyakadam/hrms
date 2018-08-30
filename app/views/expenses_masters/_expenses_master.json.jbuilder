json.extract! expenses_master, :id, :expence_opestion_id, :mode_id, :billing_opestion, :billing_option_id, :employee_grade_id, :min_amount, :max_amount, :status, :created_at, :updated_at
json.url expenses_master_url(expenses_master, format: :json)
