class AddColToLeaveCOff < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :status, :boolean
    add_column :leave_c_offs, :current_status, :string
  end
end
