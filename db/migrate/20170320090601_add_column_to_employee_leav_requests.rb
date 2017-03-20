class AddColumnToEmployeeLeavRequests < ActiveRecord::Migration
  def change
  	add_column :employee_leav_requests, :half_day_present, :boolean,  default: true
  	add_column :on_duty_requests, :half_day_present, :boolean,  default: true
  end
end
