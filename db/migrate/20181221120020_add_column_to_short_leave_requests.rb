class AddColumnToShortLeaveRequests < ActiveRecord::Migration
  def change
  	add_column :short_leave_requests, :leave_reason, :string
  end
end
