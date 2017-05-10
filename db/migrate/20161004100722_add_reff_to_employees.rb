class AddReffToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :employee_code_master, index: true, foreign_key: true
  end
end
