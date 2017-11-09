class AddReferencesToTables < ActiveRecord::Migration
  def change
  	add_reference :company_time_masters, :shift_master, index: true, foreign_key: true
  	add_reference :machine_attendances, :shift_master, index: true, foreign_key: true
  	add_reference :employee_attendances, :company_time_master, index: true, foreign_key: true
  end
end
