class CreateIssueLockerHistories < ActiveRecord::Migration
  def change
    create_table :issue_locker_histories do |t|
      t.references :issue_locker, index: true, foreign_key: true
      t.references :issue_request, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
