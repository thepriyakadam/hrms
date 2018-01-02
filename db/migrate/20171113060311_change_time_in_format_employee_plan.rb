class ChangeTimeInFormatEmployeePlan < ActiveRecord::Migration
  def change
  	change_column :employee_plans, :from_time, :time
  	change_column :employee_plans, :to_time, :time
  end
end
