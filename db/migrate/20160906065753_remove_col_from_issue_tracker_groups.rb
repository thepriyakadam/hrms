class RemoveColFromIssueTrackerGroups < ActiveRecord::Migration
  def change
    remove_column :issue_tracker_groups, :contact_number, :integer
    add_column :issue_tracker_groups, :contact_number, :string
  end
end
