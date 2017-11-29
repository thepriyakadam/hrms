json.extract! employee_jc_list, :id, :joining_checklist_master_id, :employee_id, :admin_id, :status, :created_at, :updated_at
json.url employee_jc_list_url(employee_jc_list, format: :json)
