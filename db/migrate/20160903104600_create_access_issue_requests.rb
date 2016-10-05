class CreateAccessIssueRequests < ActiveRecord::Migration
  def change
    create_table :access_issue_requests do |t|
      t.references :issue_tracker_access, index: true, foreign_key: true
      t.references :issue_request, index: true, foreign_key: true
      t.boolean :status
      t.boolean :current_status

      t.timestamps null: false
    end
  end
end
