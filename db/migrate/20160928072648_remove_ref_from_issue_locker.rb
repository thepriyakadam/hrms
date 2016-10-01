class RemoveRefFromIssueLocker < ActiveRecord::Migration
  def change
  	 remove_reference :issue_lockers, :employee, index: true, foreign_key: true
  end
end
