class AddRefToEmployeeResignation < ActiveRecord::Migration
  def change
    add_reference :employee_resignations, :reporting_master, index: true, foreign_key: true
  end
end
