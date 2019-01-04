class CreateWorkingdays < ActiveRecord::Migration
  def change
    create_table :workingdays do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :date
      t.string :month_name
      t.string :year
      t.date :from
      t.date :to
      t.integer :day_in_month
      t.decimal :present_day, precision: 10, scale: 2
      t.decimal :holiday_in_month, precision: 10, scale: 2
      t.decimal :week_off_day, precision: 10, scale: 2
      t.decimal :absent_day, precision: 10, scale: 2
      t.decimal :payable_day, precision: 10, scale: 2
      t.decimal :nonpayable_day, precision: 10, scale: 2
      t.decimal :calculated_payable_days, precision: 10, scale: 2
      t.decimal :pay_leave, precision: 10, scale: 2
      t.decimal :nonpay_leave, precision: 10, scale: 2
      t.decimal :od_day, precision: 10, scale: 2
      t.decimal :ot_hours, precision: 10, scale: 2
      t.decimal :total_leave, precision: 10, scale: 2
      t.boolean :paid
      t.boolean :full_and_final
      t.boolean :is_confirm
     
      t.timestamps null: false
    end
  end
end
  