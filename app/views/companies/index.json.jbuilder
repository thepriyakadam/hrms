json.array!(@companies) do |company|
  json.extract! company, :id, :group_id, :name, :company_type, :registration_no, :pan_card_no, :tax_no, :professional_tax_no, :address, :city, :district, :pin_code, :state, :email, :contact_no, :web_site, :starting_date, :ceo_name
  json.url company_url(company, format: :json)
end
