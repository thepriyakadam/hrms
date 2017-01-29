class AddRefToIssueTrackerAccesses < ActiveRecord::Migration
  def change
    add_reference :issue_tracker_accesses, :issue_tracker_group, index: true, foreign_key: true
    remove_reference :issue_tracker_accesses, :employee, index: true, foreign_key: true
  end
end
