json.array!(@performance_activities) do |performance_activity|
  json.extract! performance_activity, :id, :code, :name, :description
  json.url performance_activity_url(performance_activity, format: :json)
end
