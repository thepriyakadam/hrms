class CreateMachineAttendances < ActiveRecord::Migration
  def change
    create_table :machine_attendances do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :day
      t.datetime :in
      t.datetime :out
      t.references :shift_master, index: true, foreign_key: true
      t.boolean :is_proceed
      t.string :present
      t.references :user
      t.boolean :is_updated

      t.timestamps null: false
    end
  end
end
