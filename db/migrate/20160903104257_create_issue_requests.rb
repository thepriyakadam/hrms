class CreateIssueRequests < ActiveRecord::Migration
  def change
    create_table :issue_requests do |t|
      t.references :issue_master, index: true, foreign_key: true
      t.references :issue_tracker_member, index: true, foreign_key: true
      t.references :issue_tracker_group, index: true, foreign_key: true
      t.string :description
      t.date :date
      t.time :time
      t.references :employee, index: true, foreign_key: true
      t.string :issue_priority
      t.references :status, index: true, foreign_key: true
      t.references :is_confirm, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
