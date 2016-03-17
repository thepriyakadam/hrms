class ChangeColToOvertimeSalary < ActiveRecord::Migration
  def change
    change_column :overtime_daily_records, :ot_daily_date, :date
  end
end
