class AddColToJoiningDetailandLeaveCOff < ActiveRecord::Migration
  def change
    add_column :joining_details, :c_off, :boolean
    add_column :leave_c_offs, :comment, :text
  end
end
