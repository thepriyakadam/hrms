json.array!(@leaving_reasons) do |leaving_reason|
  json.extract! leaving_reason, :id, :code, :name, :description
  json.url leaving_reason_url(leaving_reason, format: :json)
end
