class RemoveColFromIssueRequest < ActiveRecord::Migration
  def change
    remove_reference :issue_requests, :is_confirm_id, index: true, foreign_key: true
    remove_column :issue_requests, :request_status, :string
    add_column :issue_requests, :is_confirm, :boolean
  end
end
