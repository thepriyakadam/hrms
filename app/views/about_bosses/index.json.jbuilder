json.array!(@about_bosses) do |about_boss|
  json.extract! about_boss, :id, :code, :name, :description, :status
  json.url about_boss_url(about_boss, format: :json)
end
