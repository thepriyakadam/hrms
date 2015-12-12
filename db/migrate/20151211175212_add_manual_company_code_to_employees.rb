class AddManualCompanyCodeToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :manual_employee_code, :string
    add_column :departments, :manual_department_code, :string
    add_column :company_locations, :manual_company_location_code, :string
    add_column :companies, :manual_company_code, :string

    add_reference :companies, :country, index: true, foreign_key: true
  	add_reference :companies, :state, index: true, foreign_key: true
  	add_reference :companies, :district, index: true, foreign_key: true

  	remove_column :companies, :country
  	remove_column :companies, :state
  	remove_column :companies, :district
  end
end
