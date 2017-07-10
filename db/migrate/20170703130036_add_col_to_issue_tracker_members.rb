class AddColToIssueTrackerMembers < ActiveRecord::Migration
  def change
    add_column :issue_tracker_members, :role, :string
  end
end
