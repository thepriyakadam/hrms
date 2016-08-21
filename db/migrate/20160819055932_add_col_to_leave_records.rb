class AddColToLeaveRecords < ActiveRecord::Migration
  def change
  	remove_column :leave_records, :employee_leave_request, :integer
  	add_reference :leave_records, :employee_leav_request, index: true, foreign_key: true
  end
end
