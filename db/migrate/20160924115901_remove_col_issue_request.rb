class RemoveColIssueRequest < ActiveRecord::Migration
  def change
  	remove_column :issue_requests, :is_confirm_id, :integer
  	remove_column :issue_requests, :is_confirm, :boolean
  	add_column :issue_requests, :is_confirm, :boolean
  end
end
