json.extract! on_duty_request, :id, :employee_id, :leave_type, :start_date, :end_date, :no_of_day, :reason, :first_reporter_id, :second_reporter_id, :first_half, :last_half, :current_status, :is_pending, :is_cancelled, :is_first_approved, :is_second_approved, :is_first_rejected, :is_second_rejected, :created_at, :updated_at
json.url on_duty_request_url(on_duty_request, format: :json)