json.array!(@pf_masters) do |pf_master|
  json.extract! pf_master, :id, :is_pf, :percentage, :date_effective, :min_limit, :base_component, :is_active
  json.url pf_master_url(pf_master, format: :json)
end
