class CreateEmployeeArrearItems < ActiveRecord::Migration
  def change
    create_table :employee_arrear_items do |t|
      t.references :employee_arrear, index: true, foreign_key: true
      t.references :salary_component, index: true, foreign_key: true
      t.decimal :actual_amount, precision: 15, scale: 2, default: 0
      t.decimal :calculated_amount, precision: 15, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end
