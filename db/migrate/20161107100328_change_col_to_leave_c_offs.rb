class ChangeColToLeaveCOffs < ActiveRecord::Migration
  def change
  	change_column :leave_c_offs, :c_off_expire_day, :integer, default: false
  end
end
