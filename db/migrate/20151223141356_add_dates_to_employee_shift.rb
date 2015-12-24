class AddDatesToEmployeeShift < ActiveRecord::Migration
  def change
    add_column :employee_shifts, :from_date, :date
    add_column :employee_shifts, :to_date, :date
  end
end
