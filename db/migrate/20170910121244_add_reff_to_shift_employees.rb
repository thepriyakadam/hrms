class AddReffToShiftEmployees < ActiveRecord::Migration
  def change
     add_reference :shift_employees, :shift_time, index: true, foreign_key: true
     add_reference :shift_employees, :created_by
   end
end
