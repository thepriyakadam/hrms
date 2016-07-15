json.array!(@reward_recognitions) do |reward_recognition|
  json.extract! reward_recognition, :id, :reward_type_id, :type, :reward_owner_id, :cost_unit, :communication
  json.url reward_recognition_url(reward_recognition, format: :json)
end
