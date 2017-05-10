json.array!(@about_companies) do |about_company|
  json.extract! about_company, :id, :code, :name, :description, :status
  json.url about_company_url(about_company, format: :json)
end
