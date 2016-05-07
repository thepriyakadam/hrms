json.array!(@employee_nominations) do |employee_nomination|
  json.extract! employee_nomination, :id, :nominational_master_id, :family_id, :nomination, :mental_illness, :minor, :guardian_name, :relation_id, :same_address, :address, :city, :district_id, :state_id, :contry_id, :pin_code, :phone_no, :mobile_no, :email
  json.url employee_nomination_url(employee_nomination, format: :json)
end
