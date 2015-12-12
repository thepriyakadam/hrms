class AddRefToLocationEmployeeFamily < ActiveRecord::Migration
  def change
  	add_reference :company_locations, :country, index: true, foreign_key: true
  	add_reference :company_locations, :state, index: true, foreign_key: true
  	add_reference :company_locations, :district, index: true, foreign_key: true

  	remove_column :company_locations, :country
  	remove_column :company_locations, :state
  	remove_column :company_locations, :district

  	add_reference :employees, :country, index: true, foreign_key: true
  	add_reference :employees, :state, index: true, foreign_key: true
  	add_reference :employees, :district, index: true, foreign_key: true

  	remove_column :employees, :country
  	remove_column :employees, :state
  	remove_column :employees, :district

  	add_reference :families, :country, index: true, foreign_key: true
  	add_reference :families, :state, index: true, foreign_key: true
  	add_reference :families, :district, index: true, foreign_key: true

  	remove_column :families, :country
  	remove_column :families, :state
  	remove_column :families, :dist
  end
end
