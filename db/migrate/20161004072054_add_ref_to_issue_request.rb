class AddRefToIssueRequest < ActiveRecord::Migration
  def change
  	add_reference :issue_requests, :issue_root_cause, index: true, foreign_key: true
  	add_column :issue_requests, :effort_time, :string
  	add_column :issue_requests, :comment, :string
  	add_column :issue_lockers, :lock_date, :date
  	add_column :issue_lockers, :lock_time, :time
  	add_column :issue_locker_histories, :lock_date, :date
  	add_column :issue_locker_histories, :lock_time, :time
  end
end
