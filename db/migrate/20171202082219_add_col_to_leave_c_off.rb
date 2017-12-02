class AddColToLeaveCOff < ActiveRecord::Migration
  def change
    add_column :leave_c_offs, :comment, :text
  end
end
