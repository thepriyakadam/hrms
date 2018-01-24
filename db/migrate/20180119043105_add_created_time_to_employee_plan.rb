class AddCreatedTimeToEmployeePlan < ActiveRecord::Migration
  def change
  	add_column :employee_plans, :created_date, :date
  	add_column :employee_plans, :created_time, :time
  	add_column :employee_plans, :start_time, :time
  	add_column :employee_plans, :end_time, :time
  end
end
