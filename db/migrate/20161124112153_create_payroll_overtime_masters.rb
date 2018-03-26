class CreatePayrollOvertimeMasters < ActiveRecord::Migration
  def change
    create_table :payroll_overtime_masters do |t|
      t.boolean :is_payroll
      t.string :base_component
      t.string :rate
      t.boolean :is_active
      t.boolean :is_confirm
      t.string :company_hrs

      t.timestamps null: false
    end
  end
end
