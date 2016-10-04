class AddColToIssueRequest < ActiveRecord::Migration
  def change
    add_column :issue_requests, :request_status, :string
  end
end
