class CreateOvertimeDailyRecords < ActiveRecord::Migration
  def change
    create_table :overtime_daily_records do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :ot_daily_date
      t.decimal :ot_daily_hrs, precision: 15, scale: 2, default: 0
      t.decimal :ot_rate, precision: 15, scale: 2, default: 0
      t.decimal :ot_daily_amount, precision: 15, scale: 2, default: 0
      t.decimal :attendance_bonus_amount, precision: 15, scale: 2, default: 0
      t.decimal :paid_holiday_amount, precision: 15, scale: 2, default: 0
      t.timestamps null: false
    end
  end
end
