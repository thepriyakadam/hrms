class CreateSalaryslipComponents < ActiveRecord::Migration
  def change
    create_table :salaryslip_components do |t|
      t.references :salaryslip, index: true, foreign_key: true
      t.references :salary_component, index: true, foreign_key: true
      t.decimal :amount, precision: 15, scale: 2
      t.boolean :is_deducted

      t.timestamps null: false
    end
  end
end
