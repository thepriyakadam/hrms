class CreateEmployeeAttendances < ActiveRecord::Migration
  def change
    create_table :employee_attendances do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :day
      t.string :present
      t.time :in
      t.time :out

      t.timestamps null: false
    end
  end
end
