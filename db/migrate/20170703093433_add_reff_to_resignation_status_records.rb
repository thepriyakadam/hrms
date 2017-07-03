class AddReffToResignationStatusRecords < ActiveRecord::Migration
  def change
  	remove_reference :resignation_status_records, :change_status_employee, index: true, foreign_key: true
  	add_reference :resignation_status_records ,:change_status_employee
  end
end
