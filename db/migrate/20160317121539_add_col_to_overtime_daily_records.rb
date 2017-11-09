class AddColToOvertimeDailyRecords < ActiveRecord::Migration
  def change
    add_column :overtime_daily_records, :attendance_bonus_amount, :decimal, precision: 15, scale: 2, default: 0
    add_column :overtime_daily_records, :paid_holiday_amount, :decimal, precision: 15, scale: 2, default: 0
  end
end
