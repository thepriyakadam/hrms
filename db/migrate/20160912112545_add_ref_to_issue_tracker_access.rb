class AddRefToIssueTrackerAccess < ActiveRecord::Migration
  def change
    add_reference :issue_tracker_accesses, :issue_tracker_member, index: true, foreign_key: true
  end
end
