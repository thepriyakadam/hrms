class CreateIssueTrackerMembers < ActiveRecord::Migration
  def change
    create_table :issue_tracker_members do |t|
      t.references :issue_tracker_group, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
