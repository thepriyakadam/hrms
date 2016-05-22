json.array!(@training_topic_masters) do |training_topic_master|
  json.extract! training_topic_master, :id, :code, :name, :description, :status
  json.url training_topic_master_url(training_topic_master, format: :json)
end
