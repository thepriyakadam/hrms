class AddColToIssueLocker < ActiveRecord::Migration
  def change
  	add_reference :issue_lockers, :issue_tracker_member_id, index: true, foreign_key: true
  	remove_reference :issue_lockers, :employee_id, index: true, foreign_key: true
  end
end
