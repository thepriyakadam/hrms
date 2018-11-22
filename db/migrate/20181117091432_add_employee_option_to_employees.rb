class AddEmployeeOptionToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :employee_option, :string
    add_column :employees, :emergency_contact_no, :string
  end
end
