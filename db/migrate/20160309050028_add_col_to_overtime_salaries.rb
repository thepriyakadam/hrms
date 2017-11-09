class AddColToOvertimeSalaries < ActiveRecord::Migration
  def change
    add_column :overtime_salaries, :basic_amount, :decimal, precision: 15, scale: 2, default: 0.0
    add_column :overtime_salaries, :ot_amount, :decimal, precision: 15, scale: 2, default: 0.0
  end
end
