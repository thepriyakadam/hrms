class AddColToShiftTimes < ActiveRecord::Migration
   def change
     add_column :shift_times, :name, :string
   end
end
