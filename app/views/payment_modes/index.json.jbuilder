json.array!(@payment_modes) do |payment_mode|
  json.extract! payment_mode, :id, :code, :name, :description
  json.url payment_mode_url(payment_mode, format: :json)
end
