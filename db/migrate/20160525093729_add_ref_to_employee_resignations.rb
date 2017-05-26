class AddRefToEmployeeResignations < ActiveRecord::Migration
  def change
    add_reference :employee_resignations, :leaving_reason, index: true, foreign_key: true
  end
end
