class AddColToLeaveCOffs < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :current_status, :string
  end
end
