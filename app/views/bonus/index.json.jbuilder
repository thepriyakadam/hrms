json.array!(@bonus) do |bonu|
  json.extract! bonu, :id, :employee_id, :bonus_amount, :bouns_date
  json.url bonu_url(bonu, format: :json)
end
