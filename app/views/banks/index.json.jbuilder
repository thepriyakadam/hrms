json.array!(@banks) do |bank|
  json.extract! bank, :id, :name, :code, :description
  json.url bank_url(bank, format: :json)
end
