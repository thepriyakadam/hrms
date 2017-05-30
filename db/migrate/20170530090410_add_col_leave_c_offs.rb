class AddColLeaveCOffs < ActiveRecord::Migration
  def change
  	add_column :leave_c_offs, :status, :string
  end
end
