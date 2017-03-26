class CreateShiftRotations < ActiveRecord::Migration
  def change
    create_table :shift_rotations do |t|
      t.references :company_shift, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
