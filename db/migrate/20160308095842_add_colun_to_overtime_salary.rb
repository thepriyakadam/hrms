class AddColunToOvertimeSalary < ActiveRecord::Migration
  def change
    add_column :overtime_salaries, :ot_date, :date
    remove_column :overtime_salaries, :date, :date
  end
end
