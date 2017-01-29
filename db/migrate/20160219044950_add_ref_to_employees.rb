class AddRefToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :company_location, index: true, foreign_key: true
    add_reference :employees, :company, index: true, foreign_key: true
    add_column :joining_details, :is_society_member, :boolean
    remove_column :joining_details, :location_id
    remove_column :joining_details, :company_location_id
  end
end
