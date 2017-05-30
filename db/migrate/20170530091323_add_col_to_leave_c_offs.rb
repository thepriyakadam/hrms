class AddColToLeaveCOffs < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :current_status, :string
    remove_column :leave_c_offs, :status, :string
    add_column :leave_c_offs, :status, :boolean
  end
end
