class CreateEmployeeShifts < ActiveRecord::Migration
  def change
    create_table :employee_shifts do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :from_date
      t.date :to_date
      t.timestamps null: false
    end
  end
end
