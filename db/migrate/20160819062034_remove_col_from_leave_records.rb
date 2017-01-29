class RemoveColFromLeaveRecords < ActiveRecord::Migration
  def change
  	remove_column :leave_records, :employee_leave_request_id
  end
end
