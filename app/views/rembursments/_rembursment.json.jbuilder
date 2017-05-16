json.extract! rembursment, :id, :employee_id, :manager_id, :application_date, :rembursment_date, :rembursmentmaster_id, :amount, :paid_date, :status, :created_at, :updated_at
json.url rembursment_url(rembursment, format: :json)
