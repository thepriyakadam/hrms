class CreateSalaryslipComponents < ActiveRecord::Migration
  def change
    create_table :salaryslip_components do |t|
      t.references :salaryslip, index: true, foreign_key: true
      t.references :salary_component, index: true, foreign_key: true
      t.decimal :actual_amount, precision: 15, scale: 2
      t.decimal :calculated_amount, precision: 15, scale: 2
      t.boolean :is_deducted
      t.references :employee_template, index: true, foreign_key: true
      t.boolean :is_arrear
      t.timestamps null: false
    end
  end
end
