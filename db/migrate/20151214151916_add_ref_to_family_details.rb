class AddRefToFamilyDetails < ActiveRecord::Migration
  def change
  	remove_column :families, :permanent_address
  	remove_column :families, :city
  	remove_column :families, :pin_code
  	remove_column :families, :current_address
  	remove_column :families, :status

  	remove_column  :families, :country_id
    remove_column  :families, :state_id
    remove_column :families, :district_id
   

    add_column :families, :issue_date, :date
    add_column :families, :expiry_date, :date
    
  end
end
