class CreateShiftSchuduleExcels < ActiveRecord::Migration
  def change
    create_table :shift_schudule_excels do |t|
      t.date :attendance_date
      t.references :employee, index: true, foreign_key: true
      t.references :shift_time, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
