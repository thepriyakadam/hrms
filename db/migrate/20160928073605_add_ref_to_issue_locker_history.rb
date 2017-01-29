class AddRefToIssueLockerHistory < ActiveRecord::Migration
  def change
  	add_reference :issue_locker_histories, :issue_tracker_member, index: true, foreign_key: true
  end
end
