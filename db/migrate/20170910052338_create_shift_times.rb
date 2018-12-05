class CreateShiftTimes < ActiveRecord::Migration
  def change
     create_table :shift_times do |t|
       t.string :shift
       t.time :from
       t.time :to
       t.string :working_hrs
       t.text :description
       t.boolean :status

       t.timestamps null: false
     end
   end
end
