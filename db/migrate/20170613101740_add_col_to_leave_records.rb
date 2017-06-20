class AddColToLeaveRecords < ActiveRecord::Migration
  def change
  	remove_column :leave_records, :count, :decimal
  	add_column :leave_records, :count, :decimal, precision: 15, scale: 2
  end
end
