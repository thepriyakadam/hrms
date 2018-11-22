class CreateShiftSchedules < ActiveRecord::Migration
  def change
    create_table :shift_schedules do |t|
      t.references :shift_time, index: true, foreign_key: true
      t.date :from
      t.date :to
      t.boolean :status

      t.timestamps null: false
    end
  end
end
