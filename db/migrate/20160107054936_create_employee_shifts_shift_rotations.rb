class CreateEmployeeShiftsShiftRotations < ActiveRecord::Migration
  def change
    create_table :employee_shifts_shift_rotations do |t|
      t.references :shift_rotation, index: true, foreign_key: true
      t.references :employee_shift, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
