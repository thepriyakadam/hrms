class AddNewColToEmployeeResignations < ActiveRecord::Migration
  def change
    add_column :employee_resignations, :application_date, :datetime
  end
end
