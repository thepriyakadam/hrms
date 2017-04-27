class AddLeaveCountToLeavCOff < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :leave_count, :decimal, precision: 3, scale: 1
  end
end
