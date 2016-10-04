class CreateIssueRootCauses < ActiveRecord::Migration
  def change
    create_table :issue_root_causes do |t|
      t.references :issue_tracker_group, index: true, foreign_key: true
      t.string :name
      t.boolean :is_active
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
