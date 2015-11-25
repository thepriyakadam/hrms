class AddRangeToEmployeeLeavRequest < ActiveRecord::Migration
  def change
  	add_column :employee_leav_requests, :date_range, :string
  end
end
