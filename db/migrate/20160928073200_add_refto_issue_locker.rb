class AddReftoIssueLocker < ActiveRecord::Migration
  def change
  	 add_reference :issue_lockers, :issue_tracker_member, index: true, foreign_key: true

  end
end
