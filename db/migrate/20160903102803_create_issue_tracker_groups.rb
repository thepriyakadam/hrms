class CreateIssueTrackerGroups < ActiveRecord::Migration
  def change
    create_table :issue_tracker_groups do |t|
      t.string :name
      t.string :email
      t.string :contact_number
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
