class CreateEmployeeShifts < ActiveRecord::Migration
  def change
    create_table :employee_shifts do |t|
      t.references :company_shift, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
