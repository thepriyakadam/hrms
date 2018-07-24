class CreateIssueTrackerAccesses < ActiveRecord::Migration
  def change
    create_table :issue_tracker_accesses do |t|
      t.string :name
      t.string :role
      t.boolean :status
      t.boolean :is_confirm
      t.references :issue_tracker_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
