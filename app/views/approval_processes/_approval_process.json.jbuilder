json.extract! approval_process, :id, :membership_id, :from, :to, :status, :created_at, :updated_at
json.url approval_process_url(approval_process, format: :json)
