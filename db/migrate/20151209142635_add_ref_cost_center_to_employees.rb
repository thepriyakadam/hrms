class AddRefCostCenterToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :employee, index: true, foreign_key: true
    add_reference :joining_details, :employee_designation, index: true, foreign_key: true
  end
end
