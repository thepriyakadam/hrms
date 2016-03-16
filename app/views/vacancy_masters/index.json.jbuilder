json.array!(@vacancy_masters) do |vacancy_master|
  json.extract! vacancy_master, :id, :job_title, :vacancy_name, :educational_qualification, :no_of_position, :description, :vacancy_post_date, :department_name, :budget
  json.url vacancy_master_url(vacancy_master, format: :json)
end
