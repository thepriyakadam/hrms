class RemoveRefFromIssueLockerHistory < ActiveRecord::Migration
  def change
    remove_reference :issue_locker_histories, :employee, index: true, foreign_key: true

  end
end
