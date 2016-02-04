json.array!(@retention_moneys) do |retention_money|
  json.extract! retention_money, :id, :have_retention, :amount, :no_of_month, :description
  json.url retention_money_url(retention_money, format: :json)
end
