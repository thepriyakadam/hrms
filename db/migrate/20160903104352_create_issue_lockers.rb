class CreateIssueLockers < ActiveRecord::Migration
  def change
    create_table :issue_lockers do |t|
      t.references :issue_request, index: true, foreign_key: true
      t.references :issue_tracker_member, index: true, foreign_key: true
      t.boolean :status
      t.date :lock_date
  	  t.time :lock_time

      t.timestamps null: false
    end
  end
end
