class ChangeDataTypeForLeaveRecords < ActiveRecord::Migration
  def change
  	change_column :leave_records, :count,:decimal, :precision => 2, :scale => 1
  end
end
