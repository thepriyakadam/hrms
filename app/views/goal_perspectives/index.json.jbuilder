json.array!(@goal_perspectives) do |goal_perspective|
  json.extract! goal_perspective, :id, :name
  json.url goal_perspective_url(goal_perspective, format: :json)
end
