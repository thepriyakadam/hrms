class AddListedCompanyToEmployeePlan < ActiveRecord::Migration
  def change
  	add_reference :employee_plans, :listed_company, index: true, foreign_key: true
	add_column :employee_plans, :plan_or_unplan, :boolean
	add_column :employee_plans, :start_latitude, :decimal
	add_column :employee_plans, :start_longitude, :decimal
	add_column :employee_plans, :start_place, :string
	add_column :employee_plans, :end_latitude, :decimal
	add_column :employee_plans, :end_longitude, :decimal
	add_column :employee_plans, :end_place, :string
	add_column :employee_plans, :present_latitude, :decimal
	add_column :employee_plans, :present_longitude, :decimal
	add_column :employee_plans, :present_place, :string
  end
end
