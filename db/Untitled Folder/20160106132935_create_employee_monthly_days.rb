class CreateEmployeeMonthlyDays < ActiveRecord::Migration
  def change
    create_table :employee_monthly_days do |t|
      t.references :employee, index: true, foreign_key: true
      t.string :month
      t.references :year, index: true, foreign_key: true
      t.decimal :overtime, precision: 4, scale: 1
      t.string :no_of_working_day

      t.timestamps null: false
    end
  end
end
