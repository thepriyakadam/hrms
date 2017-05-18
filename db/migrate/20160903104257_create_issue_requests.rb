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
      t.boolean :status
      t.boolean :is_confirm
      t.references :issue_root_cause, index: true, foreign_key: true
      t.string :effort_time
      t.string :comment

     t.boolean :is_complete

      t.timestamps null: false
    end
  end
end
