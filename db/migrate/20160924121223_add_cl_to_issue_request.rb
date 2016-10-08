class AddClToIssueRequest < ActiveRecord::Migration
  def change
    add_column :issue_requests, :is_complete, :boolean
  end
end
