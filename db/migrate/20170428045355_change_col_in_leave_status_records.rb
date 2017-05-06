class ChangeColInLeaveStatusRecords < ActiveRecord::Migration
  def change
  	# remove_reference :leave_status_records, :change_status_employee, index: true, foreign_key: true
  	# add_reference :leave_status_records ,:change_status_employee
  end
end
