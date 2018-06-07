class AddStartDateAndEndDateToEmployeePlan < ActiveRecord::Migration
  def change
  	add_column :employee_plans, :start_date, :date
  	add_column :employee_plans, :end_date, :date
  end
end
