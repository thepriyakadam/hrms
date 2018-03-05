class ChangeColInToLeaveRecord < ActiveRecord::Migration
  def change
  	
change_column :leave_records, :count, :decimal, precision: 15, scale: 2
  end
end
