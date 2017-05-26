class CreateEmployeeAttendances < ActiveRecord::Migration
  def change
    create_table :employee_attendances do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :day
      t.string :present

    t.time :in_time
    t.time :out_time
    t.references :machine_attendance, index: true, foreign_key: true
    t.string :company_hrs
    t.string :overtime_hrs
      t.boolean :is_confirm, default: false

      t.timestamps null: false
    end
  end
end
