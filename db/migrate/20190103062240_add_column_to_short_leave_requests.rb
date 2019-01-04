class AddColumnToShortLeaveRequests < ActiveRecord::Migration
  def change
    add_column :short_leave_requests, :process_done, :string
    add_reference :short_leave_requests, :leav_category, index: true, foreign_key: true
  end
end
