class CreatePayrollPeriods < ActiveRecord::Migration
  def change
    create_table :payroll_periods do |t|
      t.date :from
      t.date :to
      t.boolean :status

      t.timestamps null: false
    end
  end
end
