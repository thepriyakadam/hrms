class AddReffToLeaveRecords < ActiveRecord::Migration
  def change
    add_reference :leave_records, :employee, index: true, foreign_key: true
  end
end
