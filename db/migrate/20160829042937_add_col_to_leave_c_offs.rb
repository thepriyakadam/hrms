class AddColToLeaveCOffs < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :is_expire, :boolean
  end
end
