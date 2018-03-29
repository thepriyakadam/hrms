class ChangeDatatypeToEmployeePlan < ActiveRecord::Migration
  def change
   	change_column :employee_plans, :start_latitude, :float
   	change_column :employee_plans, :start_longitude, :float
	change_column :employee_plans, :end_latitude, :float
	change_column :employee_plans, :end_longitude, :float
	change_column :employee_plans, :present_latitude, :float
	change_column :employee_plans, :present_latitude, :float
  end
end
