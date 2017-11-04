class CreateEmployeeArrears < ActiveRecord::Migration
  def change
    create_table :employee_arrears do |t|
      t.references :employee, index: true, foreign_key: true
      t.boolean :is_paid, default: false
      t.date :start_date
      t.date :end_date
      t.date :paid_date
      t.decimal :actual_amount, precision: 15, scale: 2, default: 0
      t.decimal :calculated_amount, precision: 15, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end
