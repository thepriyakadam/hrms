class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :employee_shift, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.date :attendance_date
      t.references :shift_rotation, index: true, foreign_key: true
      t.time :check_in
      t.time :check_out
      t.decimal :company_hrs
      t.decimal :over_time_hrs
      t.decimal :total_hrs
      t.timestamps null: false
    end
  end
end
