class AddColumnToEmployeeResignations < ActiveRecord::Migration
  def change
    add_column :employee_resignations, :is_stop_pay_request, :boolean
  end
end
