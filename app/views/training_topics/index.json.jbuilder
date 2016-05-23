json.array!(@training_topics) do |training_topic|
  json.extract! training_topic, :id, :code, :name, :description, :status
  json.url training_topic_url(training_topic, format: :json)
end
