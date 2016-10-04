class RemoveRefFromIssueRequests < ActiveRecord::Migration
  def change
  	remove_reference :issue_requests, :status, index: true, foreign_key: true
  	add_column :issue_requests, :status, :boolean
  end
end
