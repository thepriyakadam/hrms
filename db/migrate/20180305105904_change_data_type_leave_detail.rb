class ChangeDataTypeLeaveDetail < ActiveRecord::Migration
  def change
change_column :leave_details, :balance, :string
  end
end
