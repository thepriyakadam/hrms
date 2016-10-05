class AddAttachmentToIssueRequest < ActiveRecord::Migration
  def change
    add_attachment :issue_requests, :document1
    add_attachment :issue_requests, :document2
  end
end
