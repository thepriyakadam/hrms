class CreateIssueTrackerAccesses < ActiveRecord::Migration
  def change
    create_table :issue_tracker_accesses do |t|
      t.string :name
      t.string :role
      t.references :employee, index: true, foreign_key: true
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
