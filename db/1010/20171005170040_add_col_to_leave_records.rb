class AddColToLeaveRecords < ActiveRecord::Migration
  def change
     remove_column :leave_records, :count
    add_column :leave_records, :count, :decimal, precision: 5, scale: 1
  end
end
