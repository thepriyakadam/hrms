json.array!(@project_masters) do |project_master|
  json.extract! project_master, :id, :code, :name, :description
  json.url project_master_url(project_master, format: :json)
end
