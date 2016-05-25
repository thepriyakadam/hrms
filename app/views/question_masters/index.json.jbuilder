json.array!(@question_masters) do |question_master|
  json.extract! question_master, :id, :code, :name, :description
  json.url question_master_url(question_master, format: :json)
end
