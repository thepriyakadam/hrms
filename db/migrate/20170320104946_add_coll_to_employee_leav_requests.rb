class AddCollToEmployeeLeavRequests < ActiveRecord::Migration
  def change
  	add_column :employee_leav_requests, :present_status, :boolean
  	add_column :on_duty_requests, :present_status, :boolean
  end
end
