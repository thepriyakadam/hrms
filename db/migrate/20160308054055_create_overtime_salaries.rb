class CreateOvertimeSalaries < ActiveRecord::Migration
  def change
    create_table :overtime_salaries do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :date
      t.decimal :ot_hrs, precision: 15, scale: 2, default: 0
      t.decimal :ot_esic_amount, precision: 15, scale: 2, default: 0
      t.decimal :total_amount, precision: 15, scale: 2, default: 0
      t.decimal :attendence_bouns_amount, precision: 15, scale: 2, default: 0
      t.decimal :paid_holiday_amount, precision: 15, scale: 2, default: 0
      t.decimal :net_payble_amount, precision: 15, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end
