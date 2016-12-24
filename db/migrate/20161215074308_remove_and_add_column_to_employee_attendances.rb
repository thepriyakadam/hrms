class RemoveAndAddColumnToEmployeeAttendances < ActiveRecord::Migration
  def change
  	remove_column :employee_attendances, :overtime_hrs, :string
  	remove_column :employee_attendances, :company_hrs, :string
  	remove_column :employee_attendances, :total_hrs, :string
  	add_column :employee_attendances, :working_hrs, :string
  	add_column :employee_attendances, :rest_time, :string
  	add_column :employee_attendances, :difference_hrs, :string
  	add_column :employee_attendances, :overtime_hrs, :string
  end
end
