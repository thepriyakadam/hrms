json.array!(@employee_task_to_dos) do |employee_task_to_do|
  json.extract! employee_task_to_do, :id, :employee_id, :task_name, :task_date, :status, :time
  json.url employee_task_to_do_url(employee_task_to_do, format: :json)
end
