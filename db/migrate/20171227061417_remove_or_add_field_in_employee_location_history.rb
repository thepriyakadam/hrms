class RemoveOrAddFieldInEmployeeLocationHistory < ActiveRecord::Migration
  def change
  	remove_column :employee_location_histories, :date_time
  	add_column :employee_location_histories, :date, :date
  	add_column :employee_location_histories, :time, :time
  end
end
