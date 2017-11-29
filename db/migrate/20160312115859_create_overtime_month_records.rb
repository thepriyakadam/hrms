class CreateOvertimeMonthRecords < ActiveRecord::Migration
  def change
    create_table :overtime_month_records do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :overtime_data
      t.decimal :attendance_bonus_amount, precision: 15, scale: 2
      t.decimal :paid_holiday_amount, precision: 15, scale: 2

      t.timestamps null: false
    end
  end
end
