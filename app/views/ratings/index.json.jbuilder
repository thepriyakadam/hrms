json.array!(@ratings) do |rating|
  json.extract! rating, :id, :value, :discription
  json.url rating_url(rating, format: :json)
end
