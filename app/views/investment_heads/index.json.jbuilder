json.array!(@investment_heads) do |investment_head|
  json.extract! investment_head, :id, :section_id, :description, :limit
  json.url investment_head_url(investment_head, format: :json)
end
