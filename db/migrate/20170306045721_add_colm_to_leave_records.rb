class AddColmToLeaveRecords < ActiveRecord::Migration
  def change
    add_reference :leave_records, :leav_category, index: true, foreign_key: true
  end
end
