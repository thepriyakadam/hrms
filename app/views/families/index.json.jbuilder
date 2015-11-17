json.array!(@families) do |family|
  json.extract! family, :id, :employee_id, :no_of_member, :f_name, :m_name, :m_name, :l_name, :date_of_birth, :age, :contact_no, :phone_no, :email, :permanent_address, :city, :dist, :state, :pin_code, :current_address, :relation, :adhar_no, :pan_no, :passport_no, :medical_claim, :marital, :status, :nationality_id, :blood_group, :religion, :phandicap, :profession
  json.url family_url(family, format: :json)
end
