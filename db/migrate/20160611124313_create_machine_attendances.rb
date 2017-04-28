class CreateMachineAttendances < ActiveRecord::Migration
  def change
    create_table :machine_attendances do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :day
      t.datetime :in
      t.datetime :out

      t.timestamps null: false
    end
  end
end
