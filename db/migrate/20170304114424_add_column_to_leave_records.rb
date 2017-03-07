class AddColumnToLeaveRecords < ActiveRecord::Migration
  def change
    add_column :leave_records, :count, :decimal
  end
end
