json.array!(@training_records) do |training_record|
  json.extract! training_record, :id, :employee_id, :training_topic_master_id, :training_date, :duration, :location, :trainer_name
  json.url training_record_url(training_record, format: :json)
end
