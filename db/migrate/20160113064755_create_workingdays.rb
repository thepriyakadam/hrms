class CreateWorkingdays < ActiveRecord::Migration
  def change
    create_table :workingdays do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :month_name
      t.string :year
      t.integer :day_in_month
      t.decimal :present_day
      t.decimal :total_leave
      t.decimal :holiday_in_month
      t.decimal :week_off_day
      t.decimal :absent_day
      t.decimal :payable_day
      .string :lwp_leave
      .string :cl_leave
      .string :el_leave
      .string :esic_leave
      .string :coff_leave

      t.timestamps null: false
    end
  end
end
