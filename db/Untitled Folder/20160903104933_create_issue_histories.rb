class CreateIssueHistories < ActiveRecord::Migration
  def change
    create_table :issue_histories do |t|
      t.references :issue_request, index: true, foreign_key: true
      t.references :issue_master, index: true, foreign_key: true
      t.string :description
      t.date :date
      t.time :time
      t.references :employee, index: true, foreign_key: true
      t.references :issue_tracker_member, index: true, foreign_key: true
      t.references :issue_tracker_group, index: true, foreign_key: true
      t.string :issue_priority
      t.boolean :status
      t.boolean :is_confirm

      t.timestamps null: false
    end
  end
end
