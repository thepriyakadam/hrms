class AddNewColmnToEmployeeResignations < ActiveRecord::Migration
  def change
  	add_reference :employee_resignations, :second_reporter, index: true, foreign_key: true
  	add_reference :employee_resignations, :final_reporter, index: true, foreign_key: true
  	add_column :employee_resignations, :is_pending, :boolean
  	add_column :employee_resignations, :is_first_approved, :boolean
  	add_column :employee_resignations, :is_second_approved, :boolean
  	add_column :employee_resignations, :is_final_approved, :boolean
  	add_column :employee_resignations, :is_cancelled, :boolean
  	add_column :employee_resignations, :is_first_rejected, :boolean
  	add_column :employee_resignations, :is_second_rejected, :boolean
  	add_column :employee_resignations, :is_final_rejected, :boolean
  	add_column :employee_resignations, :application_date, :datetime
  end
end
