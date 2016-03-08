json.array!(@bonus_masters) do |bonus_master|
  json.extract! bonus_master, :id, :is_bouns, :limit_amount, :bonus_persentage, :status
  json.url bonus_master_url(bonus_master, format: :json)
end
