class AddReffToEmployeeAttributes < ActiveRecord::Migration
  def change
    add_reference :employee_attributes, :employee, index: true, foreign_key: true
  end
end
